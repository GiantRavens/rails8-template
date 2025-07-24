class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [ :edit, :update, :destroy ]

  def index
    @page_title = "Admin: Posts"
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @page_title = "Admin: New Post"
    @post = Post.new
  end

  def edit
    @page_title = "Admin: Edit Post - #{@post.title}"
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to admin_posts_path, notice: "Post was successfully created."
    else
      @page_title = "Admin: New Post"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: "Post was successfully updated."
    else
      @page_title = "Admin: Edit Post - #{@post.title}"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: "Post was successfully deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :is_published, :published_date, :user_id)
  end
end
