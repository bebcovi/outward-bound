require "bundler/setup"

ROOT = Bundler.root
Dir["#{ROOT}/spec/support/**/*.rb"].each { |f| require f }

require "factory_girl"
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include RSpecHelpers
  config.include FactoryGirl::Syntax::Methods

  config.alias_example_to :they
end
