class RemoveDateRangeFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :from
    remove_column :posts, :till
  end

  def down
    add_column :posts, :from, :date
    add_column :posts, :till, :date
  end
end
