class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.text :description_hr, :description_en
      t.integer :ordinal

      t.timestamps
    end
  end
end
