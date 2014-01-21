ruby "2.0.0"

source "https://rubygems.org"

gem "rails", "~> 4.0"
gem "pg"

group :assets do
  gem "sass-rails", "~> 4.0"
  gem "bourbon"
  gem "fancybox2-rails"
  gem "coffee-rails", "~> 4.0"
  gem "uglifier"
  gem "jquery-rails"
  gem "turbolinks", ">= 1.3.1"
  gem "jquery-turbolinks", ">= 1"
  gem "eco", ">= 1"
  gem "jquery-fileupload-rails", ">= 0.4"
end

# Views
gem "haml", ">= 4"
gem "haml-rails"
gem "redcarpet", ">= 2"
gem "will_paginate", ">= 3"
gem "simple_form", ">= 3.0.0"
gem "rails-i18n"
gem "draper"
gem "kaminari", "0.14.1"
gem "nokogiri"

# Database
gem "active_attr", ">= 0.8.1"
gem "squeel", ">= 1.1"
gem "carrierwave", ">= 0.8"
gem "fog", ">= 1.14"
gem "rmagick"
gem "acts_as_list", ">= 0.2"

# ActiveAdmin
gem "activeadmin",         github: "gregbell/active_admin"
gem "inherited_resources", github: "josevalim/inherited_resources"

# Security
gem "dotenv", ">= 0.7"

group :development do
  gem "spring"
  gem "pry-rails"
  gem "better_errors"
  gem "binding_of_caller", ">= 0.7.1"
  gem "thin"
  gem "quiet_assets", ">= 1.0.2"
end

group :test do
  gem "rspec-rails"
  gem "capybara", ">= 2.1"
  gem "factory_girl", ">= 4"
  gem "pry"
  gem "cucumber-rails", "1.3.0"
  gem "poltergeist"
  gem "database_cleaner"
end

group :production do
  gem "unicorn"
  gem "exception_notification", ">= 4"
  gem "rails_12factor"
  gem "newrelic_rpm"
end
