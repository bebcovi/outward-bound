class Attachment < ActiveRecord::Base
  belongs_to :post

  translates :name, :filename

  def extension
    File.extname(filename).delete(".")
  end
end
