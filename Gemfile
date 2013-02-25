ruby "2.0.0"

source "https://rubygems.org"

gem "thin"
gem "rails", ">= 3.2"
gem "pg"

group :assets do
  gem "sass-rails"
  gem "bourbon"
  gem "fancybox2-rails"
  gem "coffee-rails"
  gem "uglifier"
end

gem "jquery-rails"

# Views
gem "haml-rails"
gem "redcarpet"
gem "will_paginate"
gem "rails-i18n"

# External APIs
gem "twitter"
gem "flickr-objects", ">= 0.2"

# Database
gem "friendly_id"

# Other
gem "exception_notification"

# Caching
gem "dalli", ">= 2.6"

group :development do
  gem "better_errors"
  gem "binding_of_caller", ">= 0.7.1"
end

group :development, :test do
  gem "pry-rails"
  gem "rspec-rails"
end

group :test do
  gem "capybara"
  gem "factory_girl"
  gem "activerecord-nulldb-adapter", ">= 0.2.3"
  gem "guard-rspec", ">= 2.4.1"
  gem "rb-inotify", "~> 0.8.8"
end
