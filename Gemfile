ruby "2.0.0"

source "https://rubygems.org"

gem "rails", "4.0.0.rc2"
gem "pg"

group :assets do
  gem "sass-rails", "4.0.0.rc2"
  gem "bourbon"
  gem "fancybox2-rails"
  gem "coffee-rails"
  gem "uglifier"
end

gem "jquery-rails"

# Views
gem "haml", ">= 4"
gem "haml-rails"
gem "redcarpet", ">= 2"
gem "will_paginate", ">= 3"
gem "simple_form", "3.0.0.rc"
gem "rails-i18n"

# Database
gem "friendly_id"
gem "active_attr", ">= 0.8.1"
gem "squeel", github: "ernie/squeel"

# External APIs
gem "twitter"
gem "flickr-objects", ">= 0.2"

# Errors
gem "exception_notification"

group :development do
  gem "pry-rails"
  gem "better_errors"
  gem "binding_of_caller", ">= 0.7.1"
  gem "thin"
end

group :production do
  gem "unicorn"
end

group :test do
  gem "rspec-rails"
  gem "capybara", ">= 2.1"
  gem "factory_girl"
  gem "pry"
end
