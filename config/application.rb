require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pelicula
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #lenguage resourses
    config.i18n.default_locale = :en
    #sidwkip
    # config.active_job.queue_adapter = :sidekiq
    #sinc
    #config.active_job.queue_adapter = Rails.envproduction? ? :sidekiq : :async
  end
end
