require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module TicketMaster
  class Application < Rails::Application
    ActiveModelSerializers.config.key_transform = :camel_lower
    ActiveModelSerializers.config.adapter = :json

    config.load_defaults 6.0
    config.time_zone = 'Warsaw'

    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = %i[pl en]
    config.i18n.default_locale = :pl

    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.helper = false
    config.generators do |g|
      g.test_framework :rspec
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
