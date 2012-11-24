class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :kind
      t.string :name_hr, :name_en
      t.string :slug
      t.text :description_hr, :description_en
      t.integer :ordinal
    end
  end
end
