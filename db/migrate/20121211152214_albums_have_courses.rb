class AlbumsHaveCourses < ActiveRecord::Migration
  def up
    remove_column :albums, :identifier
  end

  def down
    add_column :albums, :identifier, :string
  end
end
