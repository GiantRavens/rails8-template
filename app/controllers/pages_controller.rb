class PagesController < ApplicationController
  def index
  end

  # GET /welcome
  def welcome
    authenticate_user! # Require authentication for the welcome page
  end

  def about
  end

  def dashboard
    authenticate_user!
  end

  def confirmation
  end

  def confirmed
    # This page is shown after a user confirms their email
    # It will automatically redirect to welcome page after a few seconds
  end
end
