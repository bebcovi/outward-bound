class AnnouncementDecorator < Draper::Decorator
  delegate_all
  translates :content

  def cover_photo_url
    post.cover_photo.file_url(:small)
  end
end
