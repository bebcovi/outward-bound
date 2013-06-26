require "squeel"

class Tweet < ActiveRecord::Base
  validates :content, presence: true
  validates :author,  presence: true
end
