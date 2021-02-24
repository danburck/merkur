require 'test_helper'

class BodiesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get show" do
    get bodies_show_url
    assert_response :success
  end
end
