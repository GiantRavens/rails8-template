require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  include ApplicationHelper

  test "posts index page loads and title contains app_name" do
    visit posts_url
    assert_title_includes_app_name
  end

  test "posts new page loads and title contains app_name" do
    visit new_post_url
    assert_title_includes_app_name
  end

  test "posts show page loads and title contains app_name" do
    post = Post.create!(title: "Show Title", body: "Body", is_published: true, published_date: Time.current, id: SecureRandom.uuid)
    visit post_url(post)
    assert_title_includes_app_name
  end

  test "posts edit page loads and title contains app_name" do
    post = Post.create!(title: "Edit Title", body: "Body", is_published: false, id: SecureRandom.uuid)
    visit edit_post_url(post)
    assert_title_includes_app_name
  end

  test "welcome page loads and title contains app_name" do
    visit welcome_url
    assert_title_includes_app_name
  end

  test "about page loads and title contains app_name" do
    visit about_url
    assert_title_includes_app_name
  end

  test "root/index page loads and title contains app_name" do
    visit root_url
    assert_title_includes_app_name
  end

  private

  def assert_title_includes_app_name
    title = page.title
    # Use the helper method app_name for the actual value
    assert_match(/.+\|\s*#{Regexp.escape(app_name)}/, title, "Expected page title to include '| #{app_name}', got '#{title}'")
  end
end
