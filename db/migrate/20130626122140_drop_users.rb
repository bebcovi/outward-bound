class DropUsers < ActiveRecord::Migration
  def change
    drop_table :users do |t|
      t.string :username
      t.string :password_digest
      t.timestamps
    end
  end
end
