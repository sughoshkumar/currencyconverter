require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Currencyconverter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # Specify extra autoloading paths
    paths = [
      "#{config.root}/lib",
      "#{config.root}/lib/integrations",
      "#{config.root}/app/decanters/parsers",
      "#{config.root}/lib/services/**/",
    ]

    config.autoload_paths   += Dir[*paths]
    config.eager_load_paths += Dir[*paths]
  end
end
