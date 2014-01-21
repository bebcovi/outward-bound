class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :image
      t.string :name_en
      t.string :name_hr
      t.text :description_en
      t.text :description_hr
      t.integer :position

      t.timestamps
    end
  end
end
