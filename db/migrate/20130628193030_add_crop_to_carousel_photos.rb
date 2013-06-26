class AddCropToCarouselPhotos < ActiveRecord::Migration
  def change
    add_column :carousel_photos, :crop_x, :float
    add_column :carousel_photos, :crop_y, :float
    add_column :carousel_photos, :crop_w, :float
    add_column :carousel_photos, :crop_h, :float
  end
end
