class CreateCarouselPhotos < ActiveRecord::Migration
  def change
    create_table :carousel_photos do |t|
      t.string :file
      t.timestamps
    end
  end
end
