require 'test_helper'

class CostTest < ActiveSupport::TestCase
  test 'valid cost' do
    cost = Cost.new(address: addresses(:one), measurement: measurements(:one), year: 2015, month:1, month_cost:900)
    assert cost.valid?
  end

  test 'invalid without a address' do
    cost = Cost.new(measurement: measurements(:one), year: 2015, month:1, month_cost:900)
 
    assert_not cost.valid?, "The cost should not be valid when missing address"
  end

  test 'invalid without a measurement' do
    cost = Cost.new(address: addresses(:one), year: 2015, month:1, month_cost:900)
 
    assert_not cost.valid?, "The cost should not be valid when missing measurement"
  end

  test 'invalid without a year' do
    cost = Cost.new(address: addresses(:one), measurement: measurements(:one), month:1, month_cost:900)

    assert_not cost.valid?, "The cost should not be valid when missing year"
  end

  test 'invalid without a month' do
    cost = Cost.new(address: addresses(:one), measurement: measurements(:one), year: 2015, month_cost:900)

    assert_not cost.valid?, "The cost should not be valid when missing month"
  end

  test 'invalid without a month cost' do
    cost = Cost.new(address: addresses(:one), measurement: measurements(:one), year: 2015, month:1)

    assert_not cost.valid?, "The cost should not be valid when missing month cost"
  end

  test 'invalid without duplicated cost' do
    cost = Cost.create(address: addresses(:one), measurement: measurements(:one), year: 2015, month:1, month_cost:900)
    cost = Cost.new(address: addresses(:one), measurement: measurements(:one), year: 2015, month:1, month_cost:900)

    assert_not cost.valid?, "cost is already defined"
  end
end