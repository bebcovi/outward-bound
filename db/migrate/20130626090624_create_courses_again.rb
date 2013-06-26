class CreateCoursesAgain < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name_en
      t.string :name_hr
      t.text :description_en
      t.text :description_hr
      t.string :dates_en
      t.string :dates_hr
      t.string :contact_en
      t.string :contact_hr
      t.string :price_en
      t.string :price_hr
      t.string :capacity_en
      t.string :capacity_hr
      t.integer :category_id
      t.string :duration_hr
      t.string :duration_en
      t.integer :application_form_id
      t.integer :album_id
    end
  end
end
