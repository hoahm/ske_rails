require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SkeRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Config Devise layout
    config.to_prepare do
      Devise::SessionsController.layout 'blank'
      Devise::RegistrationsController.layout 'blank'
      Devise::ConfirmationsController.layout 'blank'
      Devise::UnlocksController.layout 'blank'
      Devise::PasswordsController.layout 'blank'
    end

    config.autoload_paths << Rails.root.join('app')
    config.eager_load_paths << Rails.root.join('lib')
  end
end
