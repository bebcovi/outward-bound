class RemoveAlbumIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :album_id, :integer
  end
end
