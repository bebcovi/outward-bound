class EventBelongsToTraining < ActiveRecord::Migration
  def change
    rename_column :events, :post_id, :course_id
  end
end
