module Events
  module AddressBook
    class Fake
      def initialize(people_attributes = {})
        @people = people_attributes.map { |attributes| Events::Person.new(attributes) }
      end

      def upcoming(date)
        @people.map { |person| person.upcoming(date) }.flatten.compact.sort.uniq
      end
    end
  end
end