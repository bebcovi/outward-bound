class ChangeDurationOnCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :duration
    add_column :courses, :duration, :integer
  end

  def down
    remove_column :courses, :duration
    add_column :courses, :duration, :string
  end
end
