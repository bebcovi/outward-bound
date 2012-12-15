class AddApplyableToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :applyable, :boolean, default: true
  end
end
