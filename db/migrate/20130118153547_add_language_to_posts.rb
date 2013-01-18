class AddLanguageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :en, :boolean, default: true
    add_column :posts, :hr, :boolean, default: true
  end
end
