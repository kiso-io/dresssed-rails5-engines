require 'test_helper'

module AppComponent
  class UsersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @user = app_component_users(:one)
    end

    test "should get index" do
      get users_url
      assert_response :success
    end

    test "should get new" do
      get new_user_url
      assert_response :success
    end

    test "should create user" do
      assert_difference('User.count') do
        post users_url, params: { user: { username: @user.username } }
      end

      assert_redirected_to user_url(User.last)
    end

    test "should show user" do
      get user_url(@user)
      assert_response :success
    end

    test "should get edit" do
      get edit_user_url(@user)
      assert_response :success
    end

    test "should update user" do
      patch user_url(@user), params: { user: { username: @user.username } }
      assert_redirected_to user_url(@user)
    end

    test "should destroy user" do
      assert_difference('User.count', -1) do
        delete user_url(@user)
      end

      assert_redirected_to users_url
    end
  end
end