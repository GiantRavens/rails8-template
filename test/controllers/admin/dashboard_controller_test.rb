require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Sign in as admin user from fixtures
    @admin = sign_in_as_admin
  end

  test "should get index" do
    get admin_root_url
    assert_response :success
    assert_select "title", /Admin Dashboard.+\|.+/
  end

  test "should include user and post statistics" do
    # Create some test data
    2.times do |i|
      Post.create!(title: "Published Post #{i}", body: "Content", is_published: true, published_date: Time.current)
    end

    Post.create!(title: "Draft Post", body: "Content", is_published: false)

    get admin_root_url
    assert_response :success
    assert_select "div", /Total Users:\s*[2-9]\d*/
    assert_select "div", /Total Posts:\s*[3-9]\d*/
    assert_select "div", /Published Posts:\s*[2-9]\d*/
  end

  test "non-admin cannot access dashboard" do
    # Sign out admin
    delete destroy_user_session_path

    # Sign in as regular user
    sign_in_as(users(:regular_user))

    # Try to access admin dashboard
    get admin_root_url
    assert_redirected_to root_url
  end
end
