ROOT = File.expand_path("../", File.dirname(__FILE__))
Dir["#{ROOT}/spec/support/**/*.rb"].each { |f| require f }

require "factory_girl"
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include SpecHelpers
end
