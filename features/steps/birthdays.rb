require 'test/unit/assertions'
$:.unshift File.join(File.dirname(__FILE__), '..', '..', 'lib')
require 'events'

World do |world|
  world.extend(Test::Unit::Assertions)
  world
end

Given /^these people in my address book$/ do |table|

end

When /^I ask for upcoming events on (\d\d\d\d-\d\d-\d\d)$/ do |date|
  Events::CLI.new(@output = StringIO.new).run
end

Then /^I should see these results$/ do |results|
  assert_equal results, @output.read
end