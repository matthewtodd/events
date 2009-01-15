module Events
  module AddressBook
    class Fake < Base
      def initialize(people_attributes = {})
        @people = people_attributes.map { |attributes| Events::Person.new(preprocess(attributes)) }
      end

      private

      def preprocess(attributes)
        hashify(attributes, 'related_names')
        hashify(attributes, 'other_dates')
        attributes
      end

      def hashify(hash, key)
        hash[key] = hash.key?(key) ? eval(hash[key]) : {}
      end
    end
  end
end