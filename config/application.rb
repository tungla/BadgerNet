require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BadgerNet
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Load lib/ files
    config.autoload_paths += %W(#{config.root}/lib)

    # Skip authenticating devise sessions controller
    # This allows an un-authenticated user to reach the sign in page and sign
    # in while requiring authentication application wide elsewhere
    config.to_prepare do
      Devise::SessionsController.skip_before_action :authenticate_user!, raise: false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
