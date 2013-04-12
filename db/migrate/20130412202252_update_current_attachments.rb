class UpdateCurrentAttachments < ActiveRecord::Migration
  class Attachment < ActiveRecord::Base
  end

  def up
    Attachment.find_by_name_hr("Prijavnica").update_attributes(url_hr: "https://dl.dropboxusercontent.com/u/16783504/Application_form_hr.doc")
    Attachment.find_by_name_hr("Infoletter").update_attributes(url_hr: "https://dl.dropboxusercontent.com/u/16783504/Uskrs-Infoletter.pdf")
  end

  def down
  end
end
