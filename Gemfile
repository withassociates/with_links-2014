ruby "2.2.4"
source 'https://rubygems.org'

gem 'rails', '4.1.8'

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bourbon'
  gem 'foreman'
  gem 'spring-commands-rspec'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec_junit_formatter', '0.2.2'
end

gem 'activeadmin'  , github: 'activeadmin'
gem 'aws-sdk'      , '~> 1.59.1'
gem 'coffee-rails' , '~> 4.1.0'
gem 'createsend'   , '~> 4.0.2'
gem 'devise'       , '~> 3.4.1'
gem 'friendly_id'  , '~> 5.0.4'
gem 'jquery-rails'
gem 'paperclip'    , '~> 4.2.1'
gem 'sass-rails'   , '~> 5.0.0'
gem 'uglifier'     , '>= 1.3.0'
gem 'unicorn'      , '~> 4.8.3'

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'codeclimate-test-reporter'
  gem 'launchy'
  gem 'database_cleaner'
end

