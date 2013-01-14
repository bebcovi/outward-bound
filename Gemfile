ruby "1.9.3"

source :rubygems

gem "thin"
gem "rails", "~> 3.2.0"
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

# External APIs
gem "twitter"
gem "flickr-objects", ">= 0.2"

# Database
gem "friendly_id"

# Other
gem "exception_notification"

# Caching
gem "dalli", ">= 2.6"

group :development, :test do
  gem "debugger"
  gem "pry-rails"
  gem "rspec-rails"
end

group :test do
  gem "capybara"
  gem "factory_girl"
  gem "activerecord-nulldb-adapter", ">= 0.2.3"
  gem "database_cleaner"
end
