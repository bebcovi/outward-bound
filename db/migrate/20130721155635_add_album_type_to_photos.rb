class AddAlbumTypeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :album_type, :string
  end
end
