class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :body_hr, :body_en
      t.string :uid
      t.integer :ordinal

      t.timestamps
    end
  end
end
