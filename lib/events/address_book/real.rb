require 'osx/cocoa'
OSX.require_framework 'AddressBook'

module Events
  module AddressBook
    class Real < Base
      def initialize
        @people = OSX::ABAddressBook.sharedAddressBook.people.to_ruby.map do |card|
          Events::Person.new('first_name' => rubify(card.valueForProperty(OSX::KABFirstNameProperty)),
                             'last_name'  => rubify(card.valueForProperty(OSX::KABLastNameProperty)),
                             'birthday'   => rubify(card.valueForProperty(OSX::KABBirthdayProperty)))
        end
      end

      def rubify(cocoa_value)
        cocoa_value ? cocoa_value.to_ruby : nil
      end
    end
  end
end