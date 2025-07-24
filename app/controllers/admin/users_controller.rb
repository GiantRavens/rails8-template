class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [ :edit, :update, :destroy ]

  def index
    @page_title = "Admin: Users"
    @users = User.all.order(created_at: :desc)
  end

  def new
    @page_title = "Admin: New User"
    @user = User.new
  end

  def edit
    @page_title = "Admin: Edit User - #{@user.email}"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "User was successfully created."
    else
      @page_title = "Admin: New User"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if user_params[:password].blank?
      params_without_password = user_params.except(:password, :password_confirmation)
      if @user.update(params_without_password)
        redirect_to admin_users_path, notice: "User was successfully updated."
      else
        @page_title = "Admin: Edit User - #{@user.email}"
        render :edit, status: :unprocessable_entity
      end
    else
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "User was successfully updated."
      else
        @page_title = "Admin: Edit User - #{@user.email}"
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "User was successfully deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :preferred_name, :bio, :password, :password_confirmation, :is_admin)
  end
end
