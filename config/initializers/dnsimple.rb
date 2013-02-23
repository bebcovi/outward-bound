require_relative "../../lib/dnsimple"

DNSimple.configure do |config|
  config.email = ENV["DNSIMPLE_EMAIL"]
  config.token = ENV["DNSIMPLE_TOKEN"]
end
