class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name_hr
      t.string :name_en
      t.string :uid
      t.string :object
      t.integer :ordinal
    end
  end
end
