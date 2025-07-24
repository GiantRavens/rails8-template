class DeviseMailer < Devise::Mailer
  helper :application # Includes all helpers, including ApplicationHelper
  include Devise::Controllers::UrlHelpers # Optional. e.g. `confirmation_url`
  default template_path: "devise/mailer" # to make sure that your mailer uses the devise views

  # Override the default sender
  default from: "noreply@example.com"
end
