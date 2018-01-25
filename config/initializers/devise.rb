Devise.setup do |config|
  config.secret_key = Rails.application.secret.SECRET_TOKEN
  config.mailer_sender = 'please-change-me-at-config-initializers-decise@ex,com'
  #config.mailer_sender = 'Devise::Mailer'
  #config.parent_mailer = 'ActionMailer::Base'
  require 'devise/orm/active_record'
  #config.authentication_keys = [:email]
  config.authentication_keys = [:login]
  #config.request_keys = []
  #
  #
  #
  #config.omniauth_path_prefix = '/myengine/users/auth'
end

