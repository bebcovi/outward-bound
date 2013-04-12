class AddUrlToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :url_hr, :text
    add_column :attachments, :url_en, :text
  end
end
