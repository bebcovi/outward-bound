class RemoveEmailForwards < ActiveRecord::Migration
  def change
    drop_table :email_forwards do |t|
      t.string :from
      t.string :to
      t.string :uid
      t.timestamps
    end
  end
end
