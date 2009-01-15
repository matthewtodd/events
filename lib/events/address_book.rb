module Events
  module AddressBook
    class Base
      def upcoming(date)
        events = []
        @people.each { |person| events.concat(person.upcoming(date)) }
        events.sort_by { |event| event.first }.map { |event| event.last }.uniq
      end
    end
  end
end

require 'events/address_book/fake'
