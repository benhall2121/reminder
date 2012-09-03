# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Reminder::Application.initialize!

Reminder::Application.configure do
   config.gem 'apn_on_rails'
end