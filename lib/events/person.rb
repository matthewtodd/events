module Events
  class Person
    def initialize(attributes)
      @name          = "#{attributes['first_name']} #{attributes['last_name']}"
      @birthday      = recurring_date(attributes['birthday'])
      @related_names = attributes['related_names']
      @other_dates   = recurring_date(attributes['other_dates'])
    end

    def upcoming(date)
      upcoming = []

      if @birthday
        next_birthday = @birthday.next_occurrence(date)
        if next_birthday.days_until < 7
          upcoming << "#{@name} turns #{next_birthday.years_since} in #{next_birthday.days_until} days. (#{next_birthday.strftime('%A, %B %e')})".gsub(/\s+/, ' ')
        end
      end

      if @other_dates['anniversary']
        next_anniversary = @other_dates['anniversary'].next_occurrence(date)
        upcoming << "#{@name}'s #{next_anniversary.years_since} anniversary is in #{next_anniversary.days_until} days. (#{next_anniversary.strftime('%A, %B %e')})".gsub(/\s+/, ' ')
      end

      upcoming
    end

    private

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