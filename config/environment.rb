# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'john@tom.com',
  :password => 'john',
  :domain => 'tom.com',
  :address => 'smtp://127.0.0.1:1025',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
