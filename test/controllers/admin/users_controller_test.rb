require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Sign in as admin user from fixtures
    @admin = sign_in_as_admin
    @user = users(:regular_user)
  end

  test "should get index" do
    get admin_users_url
    assert_response :success
    assert_select "title", /Manage Users.+\|.+/
  end

  test "should get new" do
    get new_admin_user_url
    assert_response :success
    assert_select "title", /New User.+\|.+/
  end

  test "should create user" do
    assert_difference("User.count") do
      post admin_users_url, params: { user: { email: "newuser@example.com", password: "password123", password_confirmation: "password123", first_name: "New", last_name: "User" } }
    end

    assert_redirected_to admin_user_url(User.last)
  end

  test "should show user" do
    get admin_user_url(@user)
    assert_response :success
    assert_select "title", /User Details.+\|.+/
  end

  test "should get edit" do
    get edit_admin_user_url(@user)
    assert_response :success
    assert_select "title", /Edit User.+\|.+/
  end

  test "should update user" do
    patch admin_user_url(@user), params: { user: { first_name: "Updated", last_name: "Name" } }
    assert_redirected_to admin_user_url(@user)
    @user.reload
    assert_equal "Updated", @user.first_name
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete admin_user_url(@user)
    end

    assert_redirected_to admin_users_url
  end

  test "non-admin cannot access admin pages" do
    # Sign out admin
    delete destroy_user_session_path

    # Sign in as regular user
    sign_in_as(@user)

    # Try to access admin page
    get admin_users_url
    assert_redirected_to root_url
  end
end
