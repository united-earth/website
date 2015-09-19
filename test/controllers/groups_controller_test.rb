require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @group = groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post :create, group: { cat_activism: @group.cat_activism, cat_animal: @group.cat_animal, cat_conscious: @group.cat_conscious, cat_ecological: @group.cat_ecological, cat_economics: @group.cat_economics, cat_environment: @group.cat_environment, cat_holistic: @group.cat_holistic, cat_indi: @group.cat_indi, cat_political: @group.cat_political, cat_social: @group.cat_social, cat_tech: @group.cat_tech, comment: @group.comment, contact_email: @group.contact_email, contact_name: @group.contact_name, country: @group.country, logo: @group.logo, name: @group.name, website: @group.website }
    end

    assert_redirected_to group_path(assigns(:group))
  end

  test "should show group" do
    get :show, id: @group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group
    assert_response :success
  end

  test "should update group" do
    patch :update, id: @group, group: { cat_activism: @group.cat_activism, cat_animal: @group.cat_animal, cat_conscious: @group.cat_conscious, cat_ecological: @group.cat_ecological, cat_economics: @group.cat_economics, cat_environment: @group.cat_environment, cat_holistic: @group.cat_holistic, cat_indi: @group.cat_indi, cat_political: @group.cat_political, cat_social: @group.cat_social, cat_tech: @group.cat_tech, comment: @group.comment, contact_email: @group.contact_email, contact_name: @group.contact_name, country: @group.country, logo: @group.logo, name: @group.name, website: @group.website }
    assert_redirected_to group_path(assigns(:group))
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, id: @group
    end

    assert_redirected_to groups_path
  end
end
