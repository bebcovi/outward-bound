class AddNameToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :name_en, :string
    add_column :albums, :name_hr, :string
  end
end
