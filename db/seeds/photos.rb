require "flickr-objects"

[Album, Photo].each(&:destroy_all)

Flickr.configure do |config|
  config.api_key             = ENV["FLICKR_API_KEY"]
  config.shared_secret       = ENV["FLICKR_SHARED_SECRET"]
  config.access_token_key    = ENV["FLICKR_ACCESS_TOKEN_KEY"]
  config.access_token_secret = ENV["FLICKR_ACCESS_TOKEN_SECRET"]
end

@velebit_adventure_album = Album.create!
@kayak_adventure_album = Album.create!
@sailing_adventure_album = Album.create!
@high_wires_album = Album.create!

flickr_photos = Flickr.people.find(ENV["FLICKR_USER_ID"]).get_photos(sizes: :all).
  group_by { |photo|
    if photo.id.in?(["8217540609", "8218624036", "8218624174", "8218624304", "8217541763", "8218624700",
                     "8218624858", "8217542215", "8218625074", "8217542465", "8218625342", "8218625492",
                     "8218625608", "8218625722", "8217543033", "8217543145", "8217543275", "8217543401",
                     "8218626302", "8217543769", "8217544063", "8218626898", "8218627018", "8217544449",
                     "8218627316", "8218627490", "8217544833", "8218627772", "8218627946", "8218628058",
                     "8218623500", "8218623708", "8218623880"])
      [@velebit_adventure_album, "8217540609"]
    elsif photo.id.in?(["8263610773"])
      [@kayak_adventure_album, "8263610773"]
    elsif photo.id.in?(["8272335149"])
      [@sailing_adventure_album, "8272335149"]
    elsif photo.id.in?(["8273400766"])
      [@high_wires_album, "8273400766"]
    end
  }.
  reject { |album, photos| album.nil? }

flickr_photos.each do |(album, cover_photo_uid), photos|
  album.photos.create(photos.map do |photo|
    {
      uid:                photo.id,
      url:                photo.url,
      original_size_url:  photo.largest!.source_url,
      medium_size_url:    photo.medium!(500).source_url,
      thumbnail_size_url: photo.small!(240).source_url,
      title:              photo.title,
      stored_on:          "flickr",
    }
  end)
  album.update_attributes(cover_photo: album.photos.find_by_uid(cover_photo_uid))
end
