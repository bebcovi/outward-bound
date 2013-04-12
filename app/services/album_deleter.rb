require_relative "../../lib/flickr_client"

class AlbumDeleter
  def initialize(album)
    @album = album
  end

  def delete
    photos = @album.photos.destroy_all
    photos.each { |photo| flickr.photos.delete(photo.uid) }
    @album.destroy
  end

  private

  def flickr
    @flickr ||= FlickrClient.new
  end
end
