# encoding: utf-8

class FixEnglishTitleOfInsideOut < ActiveRecord::Migration
  def up
    post = Post.find_by_title_en("Inside Out -- Youth exchange (Velebit--Rab, 25th September -- 6th October 2012)")
    post.update_attributes(title_en: "Inside Out -- Youth exchange (Velebit--Rab, 25.9--6.10.2012.)") unless post.nil?
  end

  def down
  end
end
