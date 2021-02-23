require 'test_helper'

class BodiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get bodies_show_url
    assert_response :success
  end

end
