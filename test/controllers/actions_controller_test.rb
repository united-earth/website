require 'test_helper'

class ActionsControllerTest < ActionController::TestCase
  test "should get gathering" do
    get :gathering
    assert_response :success
  end

  test "should get com21" do
    get :com21
    assert_response :success
  end

  test "should get un_solutions_summit" do
    get :un_solutions_summit
    assert_response :success
  end

end
