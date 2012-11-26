class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :uid
      t.string :url
      t.string :source_url
      t.string :title
      t.string :stored_on

      t.references :album
    end
  end
end
