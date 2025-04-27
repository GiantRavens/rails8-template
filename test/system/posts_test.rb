require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    # Use a unique id for the fixture post to avoid collision
    @post = Post.create!(title: "Fixture Post", body: "Fixture body", is_published: false, id: SecureRandom.uuid)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit posts_url
    click_on "New post"

    fill_in "Body", with: "Some body text"
    fill_in "Title", with: "Some title"
    check "Publish now?"
    click_on "Create Post"

    assert_text "Post successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit post_url(@post)
    click_on "Edit this post", match: :first

    fill_in "Body", with: "Updated body"
    fill_in "Title", with: "Updated title"
    check "Publish now?"
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit post_url(@post)
    accept_confirm { click_on "Destroy this post", match: :first }

    assert_text "Post successfully destroyed"
  end

  test "shows published date on show page when published" do
    post = Post.create!(title: "Published Post", body: "Body", is_published: true, published_date: Time.current, id: SecureRandom.uuid)
    visit post_url(post)
    assert_text "Published:"
    assert_text post.published_date.strftime("%B %e, %Y at %l:%M%P")
  end
end
