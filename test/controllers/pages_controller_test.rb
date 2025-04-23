require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{Rails.application.config.app_name}"
    assert_select 'meta[name="description"]', content: /Welcome to #{Rails.application.config.app_name}/
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{Rails.application.config.app_name}"
    assert_select 'meta[name="description"]', content: /Learn about #{Rails.application.config.app_name}/
  end

  test "should get welcome" do
    get welcome_path
    assert_response :success
    assert_select "title", "Welcome | #{Rails.application.config.app_name}"
    assert_select 'meta[name="description"]', content: /Get started with #{Rails.application.config.app_name}/
  end
end
