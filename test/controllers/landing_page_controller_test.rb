require 'test_helper'

class LandingPageControllerTest < ActionController::TestCase
  test "should get locale_redirect" do
    get :locale_redirect
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
