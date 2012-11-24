class Post < ActiveRecord::Base
  attr_accessible :title_hr, :title_en, :body_hr, :body_en
  translates :title, :body

  default_scope order("posts.created_at DESC")

  validates_presence_of :title_hr, :title_en, :body_hr, :body_en

  before_create :delete_older_posts

  def to_s
    title
  end

  private

  def delete_older_posts
    if self.class.count == 100
      self.class.last.destroy
    end
  end
end
