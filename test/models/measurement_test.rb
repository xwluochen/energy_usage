require 'test_helper'

class MeasurementTest < ActiveSupport::TestCase
  test 'valid measurement' do
    @measurement = Measurement.new(usage: 'Total Usage (mmBTUs)')
    assert @measurement.valid?
  end

  test 'invalid without a usage' do
    @measurement = Measurement.new(usage: nil)
    assert_not @measurement.valid?, "The measurement should not be valid when missing usage"
  end

  test 'invalid without duplicated usage' do
    @measurement = Measurement.create(usage: 'Electricity Cost ($)')
    @measurement = Measurement.new(usage: 'Electricity Cost ($)')

    assert_not @measurement.valid?, "measurement is already defined"
  end
end
