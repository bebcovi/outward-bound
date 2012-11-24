class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      [:title_en, :title_hr].each { |column| t.string column }
      [:body_en, :body_hr].each { |column| t.text column }
      t.integer :photo_id
      t.integer :gallery_id

      t.timestamps
    end
  end
end
