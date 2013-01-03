class ChangePhotoAttributes < ActiveRecord::Migration
  def up
    [:original, :medium, :thumbnail].each do |size|
      rename_column :photos, :"#{size}_size_url", :"#{size}_url"
      add_column :photos, :"#{size}_width", :integer
      add_column :photos, :"#{size}_height", :integer
    end
  end

  def down
    [:original, :medium, :thumbnail].each do |size|
      rename_column :photos, :"#{size}_url", :"#{size}_size_url"
      remove_column :photos, :"#{size}_width"
      remove_column :photos, :"#{size}_height"
    end
  end
end
