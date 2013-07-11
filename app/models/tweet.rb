require "squeel"

class Tweet < ActiveRecord::Base
  validates_presence_of :content, :author
  validates_length_of :content, maximum: 140

  scope :available_in, ->(l) { where{(locale == my{l.to_s}) | (locale.in ["", nil])} }
end
