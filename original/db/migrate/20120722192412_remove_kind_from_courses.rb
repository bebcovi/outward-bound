class RemoveKindFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :kind
    add_column :courses, :category_id, :integer
  end

  def down
    add_column :courses, :kind, :string
    remove_column :courses, :category_id
  end
end
