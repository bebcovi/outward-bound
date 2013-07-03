class RenamePhotoToFileOnCarouselPhotos < ActiveRecord::Migration
  def change
    rename_column :carousel_photos, :photo, :file
  end
end
