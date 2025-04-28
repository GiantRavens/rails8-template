class Admin::DashboardController < Admin::BaseController
  def index
    @page_title = "Admin Dashboard"
    @user_count = User.count
    @post_count = Post.count
    @recent_users = User.order(created_at: :desc).limit(5)
    @recent_posts = Post.order(created_at: :desc).limit(5)
  end
end
