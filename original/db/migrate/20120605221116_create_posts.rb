class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title_hr, :title_en
      t.text :body_hr, :body_en

      t.timestamps
    end
  end
end
