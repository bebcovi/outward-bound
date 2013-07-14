class CreatePostAlbums < ActiveRecord::Migration
  def change
    create_table :post_albums do |t|
      t.integer :post_id
    end
  end
end
