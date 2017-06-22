require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  test 'valid address' do
    address = addresses(:one)
    assert address.valid?
  end

  test 'invalid without a location' do
  	address = Address.new(location: nil)
    assert_not address.valid?, "The address should not be valid when missing location"
  end

  test 'invalid without duplicated location' do
    address = Address.create(location: "3050 Webster Ave [George J. Werdan III School]")
    address = Address.new(location: '131 Irwin St [Manhattan Beach School]')

    assert_not address.valid?, "location is already defined"
  end
end