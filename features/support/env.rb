require "cucumber/rails"
require "pry"

DatabaseCleaner.strategy = :transaction
Cucumber::Rails::Database.javascript_strategy = :truncation

DatabaseCleaner.clean_with :truncation
