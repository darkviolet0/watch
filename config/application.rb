require_relative 'boot'

require 'rails/all'
require 'active_record/connection_adapters/postgis_adapter'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

I18n.locale = :fr
I18n.default_locale = :fr


module Watch
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
	
    config.i18n.default_locale = :fr
    I18n.default_locale = :fr
    I18n.locale = config.i18n.locale = config.i18n.default_locale
    config.after_initialize do
      # Add load paths straight to I18n, so engines and application can overwrite it.
      require 'active_support/i18n'
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
	end
  end
end



