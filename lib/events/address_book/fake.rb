module Events
  module AddressBook
    class Fake < Base
      def initialize(people_attributes = {})
        @people = people_attributes.map { |attributes| Events::Person.new(attributes) }
      end
    end
  end
end