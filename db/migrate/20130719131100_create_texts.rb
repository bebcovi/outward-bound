class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :controller
      t.string :action
      t.text :body_en
      t.text :body_hr

      t.timestamps
    end
  end
end
