require "carrierwave"
require "fileutils"

$initial_files = Dir[File.join(CarrierWave.root, "**/*")]

at_exit do
  created_files = Dir[File.join(CarrierWave.root, "**/*")] - $initial_files
  created_files.each do |file_path|
    unless File.directory?(file_path)
      FileUtils.rm(file_path)
    end
  end
end
