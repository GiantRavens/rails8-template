class PagesController < ApplicationController
  def index
  end

  def welcome
  end

  def about
  end

  def dashboard
    authenticate_user!
  end
end
