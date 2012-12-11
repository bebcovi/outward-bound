class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name_en
      t.string :name_hr
      t.string :slug
      t.text :description_en
      t.text :description_hr
      t.string :dates_en
      t.string :dates_hr
      t.string :contact_en
      t.string :contact_hr
      t.string :price_en
      t.string :price_hr
      t.string :duration
      t.integer :min_people
      t.integer :max_people
      t.references :album

      t.timestamps
    end
  end
end
