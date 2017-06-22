require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
 
    assert_equal "index", @controller.action_name
    assert_match "EnergyUsage", @response.body
    assert_match "Energy Usage Per Year 2015 - 2016", @response.body
    assert_response :success
  end


  test "should get usgae filter" do
    get '/dashboard/usage_filter', params: { year: 2016 }
 
    assert_equal "usage_filter", @controller.action_name
    assert_match "131 Irwin St [Manhattan Beach School]", @response.body
    assert_response :success
  end
end
