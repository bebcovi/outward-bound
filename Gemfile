ruby "1.9.3"

source :rubygems

gem "thin"
gem "rails", "~> 3.2.0"
gem "pg"

group :assets do
  gem "sass-rails"
  gem "compass", github: "chriseppstein/compass", branch: "master"
  gem "compass-rails"
  gem "coffee-rails"
  gem "uglifier"
  gem "jquery-rails"
end

# Views
gem "haml-rails"
gem "redcarpet"
gem "simple_form"
gem "rails-i18n"
gem "will_paginate"

# External APIs
gem "twitter"
gem "flickr-objects"

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
