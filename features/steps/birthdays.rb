require 'test/unit/assertions'
$:.unshift File.join(File.dirname(__FILE__), '..', '..', 'lib')
require 'events'

World do |world|
  world.extend(Test::Unit::Assertions)
  world
end

Given /^these people in my address book$/ do |table|
  Events.address_book = Events::AddressBook::Fake.new(table.hashes)
end

When /^I ask for upcoming events on (\d\d\d\d-\d\d-\d\d)$/ do |date|
  Events::CLI.new(StringIO.new(@output = '', 'w'), [date]).run
end

Then /^I should see these results$/ do |results|
  assert_equal results, @output
end