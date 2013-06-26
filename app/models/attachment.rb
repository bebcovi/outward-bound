require "squeel"

class Attachment < ActiveRecord::Base
  belongs_to :post
  belongs_to :document
end
