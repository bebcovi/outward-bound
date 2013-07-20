class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name_en
      t.string :name_hr
      t.string :photo
      t.text :biography_en
      t.text :biography_hr
      t.integer :position

      t.timestamps
    end
  end
end
