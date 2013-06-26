class ModifyPhotos < ActiveRecord::Migration
  def change
    drop_table :photos do |t|
      t.string   :uid
      t.string   :url
      t.string   :large_url
      t.string   :title
      t.string   :stored_on
      t.integer  :album_id
      t.string   :small_url
      t.string   :medium_url
      t.integer  :large_width
      t.integer  :large_height
      t.integer  :medium_width
      t.integer  :medium_height
      t.integer  :small_width
      t.integer  :small_height
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :photos do |t|
      t.string :file
      t.integer :album_id
      t.timestamps
    end
  end
end
