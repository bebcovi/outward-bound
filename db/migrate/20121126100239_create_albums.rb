class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :identifier
      t.integer :cover_photo_id
    end
  end
end
