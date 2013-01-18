class AddEventsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :event_id, :integer
    add_column :albums, :event_type, :string
  end
end
