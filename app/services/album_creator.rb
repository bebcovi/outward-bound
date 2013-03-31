require "flickr-objects"

class AlbumCreator
  def initialize(flickr_set_id)
    @flickr_set_id = flickr_set_id
  end

  def create
    configure_flickr_client

    set = Flickr.sets.find(@flickr_set_id).get_info!
    photos = set.get_photos(sizes: :all)
    album = Album.create!
    album.photos.create(photos.map do |photo|
      {
        uid:           photo.id,
        url:           photo.url,

        large_url:     photo.large1024_or_smaller.source_url,
        large_width:   photo.large1024_or_smaller.width,
        large_height:  photo.large1024_or_smaller.height,

        medium_url:    photo.medium640_or_smaller.source_url,
        medium_width:  photo.medium640_or_smaller.width,
        medium_height: photo.medium640_or_smaller.height,

        small_url:     photo.small240_or_smaller.source_url,
        small_width:   photo.small240_or_smaller.width,
        small_height:  photo.small240_or_smaller.height,

        title:         photo.title,
        stored_on:     "flickr",
      }
    end)
    primary_photo = photos.find(set.primary_photo.id)
    album.update_attributes(cover_photo: album.photos.find_by_uid(primary_photo.id))
    album
  end

  private

  def configure_flickr_client
    Flickr.configure do |config|
      config.api_key             = ENV["FLICKR_API_KEY"]
      config.shared_secret       = ENV["FLICKR_SHARED_SECRET"]
      config.access_token_key    = ENV["FLICKR_ACCESS_TOKEN_KEY"]
      config.access_token_secret = ENV["FLICKR_ACCESS_TOKEN_SECRET"]
    end
  end
end
