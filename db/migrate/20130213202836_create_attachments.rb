class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name_hr
      t.string :name_en
      t.string :filename_hr
      t.string :filename_en
      t.integer :post_id

      t.timestamps
    end
  end
end
