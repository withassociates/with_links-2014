# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
WithLinksV2::Application.initialize!

ActionMailer::Base.asset_host = "http://localhost:3000"
ActionMailer::Base.default_url_options[:host] = "localhost:3000"
