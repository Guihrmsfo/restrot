require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Restrot
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.autoload_paths += %W(#{config.root}/lib)
    
    config.assets.initialize_on_precompile = false
    
    #Configuring timezone
    config.time_zone = "Brasilia"
  end
end
