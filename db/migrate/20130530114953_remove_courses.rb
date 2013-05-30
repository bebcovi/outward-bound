class RemoveCourses < ActiveRecord::Migration
  def up
    drop_table :courses
  end

  def down
    create_table :courses do |t|
      t.string   :name_en
      t.string   :name_hr
      t.string   :slug
      t.text     :description_en
      t.text     :description_hr
      t.string   :dates_en
      t.string   :dates_hr
      t.string   :contact_en
      t.string   :contact_hr
      t.string   :price_en
      t.string   :price_hr
      t.integer  :min_people
      t.integer  :max_people
      t.integer  :album_id
      t.string   :category
      t.integer  :duration
      t.boolean  :applyable, default: true

      t.timestamps
    end
  end
end
