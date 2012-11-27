require "flickr-objects"

Flickr.configure do |config|
  config.api_key             = ENV["FLICKR_API_KEY"]
  config.shared_secret       = ENV["FLICKR_SHARED_SECRET"]
  config.access_token_key    = ENV["FLICKR_ACCESS_TOKEN_KEY"]
  config.access_token_secret = ENV["FLICKR_ACCESS_TOKEN_SECRET"]
end

flickr_user = Flickr.people.find(ENV["FLICKR_USER_ID"])
flickr_photos = flickr_user.get_photos(sizes: :all).select do |photo|
  photo.id.in? [
    "8217540609", "8218624036", "8218624174", "8218624304", "8217541763", "8218624700",
    "8218624858", "8217542215", "8218625074", "8217542465", "8218625342", "8218625492",
    "8218625608", "8218625722", "8217543033", "8217543145", "8217543275", "8217543401",
    "8218626302", "8217543769", "8217544063", "8218626898", "8218627018", "8217544449",
    "8218627316", "8218627490", "8217544833", "8218627772", "8218627946", "8218628058",
    "8218623500", "8218623708", "8218623880"
  ]
end

Album.destroy_all
album = Album.create!(identifier: "velebit_adventure")
album.photos.create(flickr_photos.map do |flickr_photo|
  {
    uid:           flickr_photo.id,
    url:           flickr_photo.url,
    source_url:    flickr_photo.largest!.source_url,
    thumbnail_url: flickr_photo.small!(240).source_url,
    title:         flickr_photo.title,
    stored_on:     "flickr",
  }
end)
album.update_attributes(cover_photo: album.photos.first)
