# mailcatcher --http-ip=0.0.0.0


# config.action_mailer.default_url_options = { host: 'localhost:3000' }

  ActionMailer::Base.smtp_settings = {
    :address              => "localhost",
    :port                 => 1025,
    :domain               => "localhost.com",
  }

# ActionMailer::Base.smtp_settings = {
#   :address              => "smtp://127.0.0.1:1025",
#   :port                 => 587,
#   :domain               => "railscasts.com",
#   :user_name            => "railscasts",
#   :password             => "secret",
#   :authentication       => "plain",
#   :enable_starttls_auto => true
# }

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
# Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?