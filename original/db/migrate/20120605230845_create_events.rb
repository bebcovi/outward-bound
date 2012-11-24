class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name_hr, :name_en
      t.date :start_at
      t.date :end_at
      t.string :color
      t.references :post

      t.timestamps
    end
  end
end
