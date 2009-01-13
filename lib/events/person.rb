module Events
  class Person
    def initialize(attributes)
      @name     = "#{attributes['first_name']} #{attributes['last_name']}"
      @birthday = RecurringDate.parse(attributes['birthday'])
    end

    def upcoming(date)
      next_birthday = @birthday.next_occurrence(date)
      if next_birthday.days_until < 7
        ["#{@name} turns #{next_birthday.years_since} in #{next_birthday.days_until} days. (#{next_birthday.strftime('%A, %B %e')})".gsub(/\s+/, ' ')]
      else
        []
      end
    end
  end
end