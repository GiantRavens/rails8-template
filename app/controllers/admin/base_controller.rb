class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  private

  def require_admin
    unless current_user.is_admin?
      flash[:alert] = "You must be an admin to access this area"
      redirect_to root_path
    end
  end
end
