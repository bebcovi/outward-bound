class RemoveEventFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :event_type, :string
    remove_column :albums, :event_id, :integer
  end
end
