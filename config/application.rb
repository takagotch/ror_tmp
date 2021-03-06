require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
#require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module MyApp
  class Application < Rails::Application
    config.load_defaults 5.1

    config.read_encrypted_secrets = true

    config.generators do |g|
      g.skip_routes true
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    config.active_job.queue_adapter = :sidekiq

    config.generators.system_tests = nil
  end
end


