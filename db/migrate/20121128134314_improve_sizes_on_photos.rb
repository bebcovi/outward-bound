class ImproveSizesOnPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :source_url, :original_size_url
    rename_column :photos, :thumbnail_url, :thumbnail_size_url
    add_column :photos, :medium_size_url, :string
  end
end
