require 'test_helper'

class Admin::Spree::UsersControllerTest < ActionController::TestCase
  setup do
    @admin_spree_user = admin_spree_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_spree_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_spree_user" do
    assert_difference('Admin::Spree::User.count') do
      post :create, admin_spree_user: {  }
    end

    assert_redirected_to admin_spree_user_path(assigns(:admin_spree_user))
  end

  test "should show admin_spree_user" do
    get :show, id: @admin_spree_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_spree_user
    assert_response :success
  end

  test "should update admin_spree_user" do
    put :update, id: @admin_spree_user, admin_spree_user: {  }
    assert_redirected_to admin_spree_user_path(assigns(:admin_spree_user))
  end

  test "should destroy admin_spree_user" do
    assert_difference('Admin::Spree::User.count', -1) do
      delete :destroy, id: @admin_spree_user
    end

    assert_redirected_to admin_spree_users_path
  end
end
