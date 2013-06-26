class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :file_en
      t.string :file_hr
      t.string :name

      t.timestamps
    end
  end
end
