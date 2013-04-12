class RemoveFilenameFromAttachments < ActiveRecord::Migration
  def up
    remove_column :attachments, :filename_hr
    remove_column :attachments, :filename_en
  end

  def down
    add_column :attachments, :filename_en, :string
    add_column :attachments, :filename_hr, :string
  end
end
