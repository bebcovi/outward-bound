require "flickr-objects"

class ChangePhotoOnEasterProgram < ActiveRecord::Migration
  def up
    post = Post.find_by_title_hr("Uskršnji program na Krku (23--30.3.2013.)")
    album = post.album
    album.cover_photo.destroy if album.cover_photo

    Photo.find_by_uid("8472214774").try(:destroy)

    Flickr.configure do |config|
      config.api_key             = ENV["FLICKR_API_KEY"]
      config.shared_secret       = ENV["FLICKR_SHARED_SECRET"]
      config.access_token_key    = ENV["FLICKR_ACCESS_TOKEN_KEY"]
      config.access_token_secret = ENV["FLICKR_ACCESS_TOKEN_SECRET"]
    end

    photo = Flickr.people.find("90463012@N03").get_photos(sizes: :all).find("8472214774")
    photo = album.photos.create!(
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
    )
    album.update_attributes(cover_photo: photo)

    post.update_attributes(created_at: Date.new(2013, 2, 13))
  end

  def down
  end
end
