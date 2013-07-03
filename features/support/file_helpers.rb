module FileHelpers
  def photo_path
    Rails.root.join("features/support/fixtures/files/lulz.png")
  end
end

World(FileHelpers)
