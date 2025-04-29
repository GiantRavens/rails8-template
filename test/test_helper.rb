ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user)
    post user_session_path, params: { user: { email: user.email, password: "password123" } }
    user
  end
  
  def sign_in_as_admin
    sign_in_as(users(:admin_user))
  end
  
  # For system tests
  def login_as(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password123"
    click_button "Sign in"
    user
  end
  
  def login_as_admin
    login_as(users(:admin_user))
  end
end
