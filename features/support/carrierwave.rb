require "carrierwave"
require "fileutils"

CarrierWave.configure do |config|
  config.storage = :file
  config.store_dir = Rails.root.join("tmp/uploads")
  config.cache_dir = Rails.root.join("tmp/uploads/cache")
end

at_exit do
  FileUtils.rm_rf(Rails.root.join("tmp/uploads"))
end
