class AddDateRangeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :from, :date
    add_column :posts, :till, :date
  end
end
