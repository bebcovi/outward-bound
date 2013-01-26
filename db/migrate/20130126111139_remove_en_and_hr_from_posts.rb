class RemoveEnAndHrFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :en
    remove_column :posts, :hr
  end

  def down
    add_column :posts, :hr, :boolean
    add_column :posts, :en, :boolean
  end
end
