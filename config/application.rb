require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PetPickupNotification
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    
    ActionMailer::Base.smtp_settings = {
      :address          => 'smtp.gmail.com' ,
      :domain           => 'mail.google.com' ,
      :port             => 587 ,
      :user_name        => "petpickuphawaii@gmail.com" ,
      :password         => "zlpwnhcbgfpcsdpn" ,
      :authentication   => 'login' ,
      :enable_starttls_auto => true
    }

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
