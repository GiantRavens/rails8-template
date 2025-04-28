require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = Post.create!(title: "Fixture Post", body: "Fixture body", is_published: false, id: SecureRandom.uuid)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1.hd1-hero", text: "All Post Entries"
    assert_selector "a", text: "New post"
  end

  test "should create post" do
    visit posts_url
    click_on "New post"

    fill_in "Title", with: "Some title"
    fill_in "Body", with: "Some body text"
    check "Publish Now?"
    click_on "Create Post"

    assert_text "Post successfully created"
    assert_selector "h1.hd1-hero", text: "Some title"
    assert_text "Published"
    click_on "Back to posts"
  end

  test "should update Post" do
    visit post_url(@post)
    click_on "Edit this post"

    fill_in "Title", with: "Updated title"
    fill_in "Body", with: "Updated body"
    check "Publish Now?"
    click_on "Update Post"

    assert_text "Post successfully updated"
    assert_selector "h1.hd1-hero", text: "Updated title"
    assert_text "Published"
    click_on "Back to posts"
  end

  test "should destroy Post" do
    visit post_url(@post)
    accept_confirm { click_on "Destroy this post" }
    assert_text "Post successfully destroyed"
  end

  test "shows published date on show page when published" do
    post = Post.create!(title: "Published Post", body: "Body", is_published: true, published_date: Time.current, id: SecureRandom.uuid)
    visit post_url(post)
    assert_text "Published"
    assert_text post.published_date.strftime("%B %-d, %Y")
  end

  test "should not show inline error explanation on new post, but show floating flash" do
    visit new_post_url
    click_on "Create Post"
    # Should not show the old error explanation block
    assert_no_selector "#error_explanation"
    # Should show a floating flash message with error
    assert_selector "#flash-messages .flash-message", text: "Title can't be blank"
    assert_selector "#flash-messages .flash-message", text: "Body can't be blank"
  end

  test "should not show inline error explanation on edit post, but show floating flash" do
    visit edit_post_url(@post)
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_on "Update Post"
    assert_no_selector "#error_explanation"
    assert_selector "#flash-messages .flash-message", text: "Title can't be blank"
    assert_selector "#flash-messages .flash-message", text: "Body can't be blank"
  end

  test "success flash disappears after 3s on create" do
    visit new_post_url
    fill_in "Title", with: "Flash timing test"
    fill_in "Body", with: "Body"
    click_on "Create Post"
    assert_selector "#flash-messages .flash-message", text: "Post successfully created"
    sleep 3.5
    assert_no_selector "#flash-messages .flash-message", text: "Post successfully created", wait: 2
  end

  test "flash message can be dismissed with close button" do
    visit new_post_url
    fill_in "Title", with: "Dismiss test"
    fill_in "Body", with: "Body"
    click_on "Create Post"
    assert_selector "#flash-messages .flash-message", text: "Post successfully created"
    find("#flash-messages .flash-message .flash-close").click
    assert_no_selector "#flash-messages .flash-message", text: "Post successfully created", wait: 2
  end
end
