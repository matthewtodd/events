module Events
  class Person
    def initialize(attributes)
      @first_name    = attributes['first_name']
      @last_name     = attributes['last_name']
      @nickname      = attributes['nickname']
      @birthday      = recurring_date(attributes['birthday'])
      @related_names = attributes['related_names']
      @other_dates   = recurring_date(attributes['other_dates'])
    end

    def upcoming(date)
      upcoming = []

      if @birthday
        next_birthday = @birthday.next_occurrence(date)
        if next_birthday.days_until < 7
          upcoming << format(":name_or_nickname turns :age :in_days. (:date)", next_birthday)
        end
      end

      if @other_dates['anniversary']
        next_anniversary = @other_dates['anniversary'].next_occurrence(date)
        if next_anniversary.days_until < 7
          upcoming << format(":name_with_spouse's :ordinal_age anniversary is :in_days. (:date)", next_anniversary)
        end
      end

      upcoming
    end

    private

    def format(string, recurring_date)
      string.sub! /:name_or_nickname/, name_or_nickname
      string.sub! /:name_with_spouse/, name_with_spouse
      string.sub! /:age/, recurring_date.years_since.to_s
      string.sub! /:ordinal_age/, ordinalize(recurring_date.years_since)
      string.sub! /:in_days/, in_days(recurring_date)
      string.sub! /:date/, recurring_date.strftime('%A, %B %e')
      string.strip!
      string.gsub!(/\s+/, ' ')
      string
    end

    def name
      "#{@first_name} #{@last_name}"
    end

    def name_or_nickname
      @nickname || name
    end

    def name_with_spouse
      if spouse_name = @related_names['spouse']
        if spouse_name =~ / #{@last_name}$/
          [@first_name, spouse_name.sub(/ #{@last_name}$/, '')].sort.join(' & ').concat(' ').concat(@last_name)
        else
          [name, spouse_name].sort.join(' & ')
        end
      else
        name
      end
    end

    def ordinalize(number)
      if (11..13).include?(number.to_i % 100)
        "#{number}th"
      else
        case number.to_i % 10
          when 1; "#{number}st"
          when 2; "#{number}nd"
          when 3; "#{number}rd"
          else    "#{number}th"
        end
      end
    end

    def in_days(recurring_date)
      case in_days = recurring_date.days_until
        when 0; "TODAY"
        when 1; "tomorrow"
        else    "in #{in_days} days"
      end
    end

    def recurring_date(date)
      case date
      when Date, Time, DateTime
        RecurringDate.new(date)
      when String
        RecurringDate.parse(date)
      when Hash
        date.inject({}) { |result, pair| result[pair.first] = recurring_date(pair.last); result }
      when NilClass
        nil
      else
        raise "Unhandled recurring date conversion: #{date.inspect}"
      end
    end
  end
end