require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "app_name returns configured application name" do
    assert_equal Rails.application.config.app_name, app_name
  end

  test "page_title returns base title when no title is set" do
    assert_equal app_name, page_title
  end

  test "page_title returns formatted title when title is set" do
    page_title "Test Page"
    assert_equal "Test Page | #{app_name}", content_for(:title)
  end

  test "meta_description returns app name when no description is set" do
    assert_equal app_name, meta_description
  end

  test "meta_description returns truncated description when set" do
    long_description = "a" * 200
    meta_description long_description
    assert_equal 160, content_for(:meta_description).length
  end

  test "og_meta_tags includes required Open Graph tags" do
    page_title "Test Page"
    meta_description "Test Description"
    
    og_tags = og_meta_tags
    assert_match /property="og:title"/, og_tags
    assert_match /property="og:description"/, og_tags
    assert_match /property="og:type"/, og_tags
    assert_match /content="Test Page/, og_tags
    assert_match /content="Test Description/, og_tags
  end
end
