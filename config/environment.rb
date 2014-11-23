# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!



Time::DATE_FORMATS[:custom_time] = "%b. %d at %I:%M %p"
