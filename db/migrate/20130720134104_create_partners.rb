class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :photo
      t.string :name_en
      t.string :name_hr
      t.string :url_en
      t.string :url_hr
      t.boolean :important, default: false
      t.integer :position

      t.timestamps
    end
  end
end
