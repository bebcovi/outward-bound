class RenameFileToPhotoInCarouselPhotos < ActiveRecord::Migration
  def change
    rename_column :carousel_photos, :file, :photo
  end
end
