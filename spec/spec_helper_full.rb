ENV["RAILS_ENV"] ||= "test"
require_relative "spec_helper_lite"

require_relative "../config/environment"

require "rspec/rails"
require "rspec/autorun"
require "capybara/rspec"

require "database_cleaner"

RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.clean
  end
end

