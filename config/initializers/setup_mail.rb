ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address                => 'smtp.sendgrid.net',
  :port                   => 587,
  :authentication         => :plain,
  :user_name              => ENV[SEND_GRID_USER_NAME],
  :password               => ENV[SEND_GRID_PASSWORD],
  :domain                 => 'heroku.com',
  :enable_starttls_auto   => true
}
