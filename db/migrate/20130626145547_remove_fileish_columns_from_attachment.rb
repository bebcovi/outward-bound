class RemoveFileishColumnsFromAttachment < ActiveRecord::Migration
  def change
    remove_column :attachments, :url_hr, :text
    remove_column :attachments, :url_en, :text
    add_column :attachments, :document_id, :integer
  end
end
