require 'test/unit'
require 'rubygems'
require 'shoulda'
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'events'

class RecurringDateTest < Test::Unit::TestCase
  context 'a recurring date' do
    setup { @recurring_date = Events::RecurringDate.parse('1978-04-03') }

    should 'return proper days_until' do
      assert_equal 5, @recurring_date.next_occurrence(Date.parse('2009-03-29')).days_until
    end

    should 'return proper years_since' do
      assert_equal 31, @recurring_date.next_occurrence(Date.parse('2009-03-29')).years_since
    end
  end

  should 'return nil when parsing nil' do
    assert_nil Events::RecurringDate.parse(nil)
  end
end