require "application_system_test_case"

class AdminTest < ApplicationSystemTestCase
  include ApplicationHelper

  setup do
    # Use admin user from fixtures
    @admin_user = users(:admin_user)

    # Sign in as admin
    login_as(@admin_user)
  end

  test "admin dashboard loads and has correct title" do
    visit admin_root_path
    assert_selector "h1", text: "Admin Dashboard"
    assert_title_includes_app_name_with("Admin Dashboard")
  end

  test "admin users index loads and has correct title" do
    visit admin_users_path
    assert_selector "h1", text: /Users/i
    assert_title_includes_app_name_with("Manage Users")
  end

  test "admin posts index loads and has correct title" do
    visit admin_posts_path
    assert_selector "h1", text: /Posts/i
    assert_title_includes_app_name_with("Manage Posts")
  end

  test "admin can create a new user" do
    visit new_admin_user_path

    fill_in "Email", with: "newuser@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    fill_in "First name", with: "New"
    fill_in "Last name", with: "User"

    assert_difference "User.count", 1 do
      click_button "Save"
    end

    assert_text "User was successfully created"
  end

  test "admin can edit a user" do
    # Use regular user from fixtures
    user = users(:regular_user)

    visit edit_admin_user_path(user)

    fill_in "First name", with: "Updated"
    click_button "Save"

    assert_text "User was successfully updated"
    user.reload
    assert_equal "Updated", user.first_name
  end

  test "non-admin cannot access admin pages" do
    # Sign out
    visit destroy_user_session_path

    # Sign in as regular user
    regular_user = users(:regular_user)
    login_as(regular_user)

    # Try to access admin page
    visit admin_root_path

    # Should be redirected to root
    assert_current_path root_path
    assert_text "You are not authorized to access this page"
  end

  private

  def assert_title_includes_app_name_with(prefix)
    title = page.title
    expected_pattern = "#{prefix} | #{app_name}"
    assert_match(/#{Regexp.escape(prefix)}\s*\|\s*#{Regexp.escape(app_name)}/, title,
      "Expected page title to be '#{expected_pattern}', got '#{title}'")
  end
end
