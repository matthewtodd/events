require 'date'

require 'events/recurring_date'
require 'events/person'
require 'events/address_book'
require 'events/cli'

module Events
  def self.address_book
    @@address_book ||= AddressBook::Real.new
  end

  def self.address_book=(address_book)
    @@address_book = address_book
  end
end
