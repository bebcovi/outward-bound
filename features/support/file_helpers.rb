require "factory_girl"

module FileHelpers
  def image_path
    Rails.root.join("features/support/fixtures/files/lulz.png")
  end

  def uploaded_file(path)
    File.open(File.join(CarrierWave.root, path))
  end
end

World(FileHelpers)
FactoryGirl::Evaluator.send(:include, FileHelpers)
