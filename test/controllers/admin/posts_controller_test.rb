require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Sign in as admin user from fixtures
    @admin = sign_in_as_admin

    # Create a post for testing
    @post = Post.create!(title: "Test Post", body: "Test content", is_published: true, published_date: Time.current)
  end

  test "should get index" do
    get admin_posts_url
    assert_response :success
    assert_select "title", /Manage Posts.+\|.+/
  end

  test "should get new" do
    get new_admin_post_url
    assert_response :success
    assert_select "title", /New Post.+\|.+/
  end

  test "should create post" do
    assert_difference("Post.count") do
      post admin_posts_url, params: { post: { title: "New Post", body: "New content", is_published: false } }
    end

    assert_redirected_to admin_post_url(Post.last)
  end

  test "should show post" do
    get admin_post_url(@post)
    assert_response :success
    assert_select "title", /Post Details.+\|.+/
  end

  test "should get edit" do
    get edit_admin_post_url(@post)
    assert_response :success
    assert_select "title", /Edit Post.+\|.+/
  end

  test "should update post" do
    patch admin_post_url(@post), params: { post: { title: "Updated Title" } }
    assert_redirected_to admin_post_url(@post)
    @post.reload
    assert_equal "Updated Title", @post.title
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete admin_post_url(@post)
    end

    assert_redirected_to admin_posts_url
  end

  test "should toggle publish status" do
    original_status = @post.is_published
    patch toggle_publish_admin_post_url(@post)

    @post.reload
    assert_equal !original_status, @post.is_published
    assert_redirected_to admin_posts_url
  end
end
