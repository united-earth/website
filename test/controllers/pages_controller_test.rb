require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get solutions" do
    get :solutions
    assert_response :success
  end

  test "should get donations" do
    get :donations
    assert_response :success
  end

end
