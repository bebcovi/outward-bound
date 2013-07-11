class RemoveSlugFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :slug, :string if column_exists?(:posts, :slug)
  end
end
