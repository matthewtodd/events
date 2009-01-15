# FIXME multiple libruby.dylib found: '/opt/local/lib/libruby.dylib' and '/usr/lib/libruby.1.dylib'
require 'osx/cocoa'
OSX.require_framework 'AddressBook'

module Events
  module AddressBook
    class Real < Base
      def initialize
        @people = OSX::ABAddressBook.sharedAddressBook.people.to_ruby.map do |card|
          Events::Person.new(attributes(card))
        end
      end

      private

      def attributes(card)
        attributes = {}
        attributes['first_name']    = rubify(card.valueForProperty(OSX::KABFirstNameProperty))
        attributes['last_name']     = rubify(card.valueForProperty(OSX::KABLastNameProperty))
        attributes['nickname']      = rubify(card.valueForProperty(OSX::KABNicknameProperty))
        attributes['birthday']      = rubify(card.valueForProperty(OSX::KABBirthdayProperty))
        attributes['related_names'] = hashify(card.valueForProperty(OSX::KABRelatedNamesProperty))
        attributes['other_dates']   = hashify(card.valueForProperty(OSX::KABOtherDatesProperty))
        attributes
      end

      def hashify(cocoa_value)
        result = {}
        if cocoa_value
          (0...cocoa_value.count).each do |index|
            result[rubify(cocoa_value.labelAtIndex(index)).downcase.gsub(/[^a-z]/,'')] = rubify(cocoa_value.valueAtIndex(index))
          end
        end
        result
      end

      def rubify(cocoa_value)
        cocoa_value ? cocoa_value.to_ruby : nil
      end
    end
  end
end