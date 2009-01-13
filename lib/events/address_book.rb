module Events
  module AddressBook
    class Base
      def upcoming(date)
        @people.map { |person| person.upcoming(date) }.flatten.compact.sort.uniq
      end
    end
  end
end

require 'events/address_book/fake'
require 'events/address_book/real'
