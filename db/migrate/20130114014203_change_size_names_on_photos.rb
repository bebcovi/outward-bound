class ChangeSizeNamesOnPhotos < ActiveRecord::Migration
  def up
    [:url, :width, :height].each do |column|
      rename_column :photos, :"original_#{column}", :"large_#{column}"
      rename_column :photos, :"thumbnail_#{column}", :"small_#{column}"
    end
  end

  def down
    [:url, :width, :height].each do |column|
      rename_column :photos, :"large_#{column}", :"original_#{column}"
      rename_column :photos, :"small_#{column}", :"thumbnail_#{column}"
    end
  end
end
