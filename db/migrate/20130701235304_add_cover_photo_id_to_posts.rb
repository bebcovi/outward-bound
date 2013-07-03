class AddCoverPhotoIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cover_photo_id, :integer
  end
end
