require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Recommendations
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml')]
    config.i18n.available_locales = [ :en, :ru ]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true

    config.generators do |g|
      g.test_framework :rspec
    end

    config.middleware.use OmniAuth::Builder do
      secrets = Rails.application.secrets
      provider :facebook, secrets.facebook_key, secrets.facebook_secret, scope: ''
    end

    config.assets.configure do |assets_config|
      assets_config.register_engine '.slim', Slim::Template
      assets_config.register_preprocessor 'application/json', Sprockets::DirectiveProcessor
    end

  end
end
