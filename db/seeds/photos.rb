require "flickr-objects"

[Album, Photo].each(&:destroy_all)

Flickr.configure do |config|
  config.api_key             = ENV["FLICKR_API_KEY"]
  config.shared_secret       = ENV["FLICKR_SHARED_SECRET"]
  config.access_token_key    = ENV["FLICKR_ACCESS_TOKEN_KEY"]
  config.access_token_secret = ENV["FLICKR_ACCESS_TOKEN_SECRET"]
end

sets = {
  "72157632508808225" => "@velebit_adventure_album",
  "72157632224161752" => "@kayak_adventure_album",
  "72157632248688104" => "@sailing_adventure_album",
  "72157632513521510" => "@team_building_album",
}

sets.each do |set_id, album_variable|
  set = Flickr.sets.find(set_id).get_info!
  photos = set.get_photos(sizes: :all)
  album = Album.create!
  album.photos.create(photos.map do |photo|
    {
      uid:              photo.id,
      url:              photo.url,

      original_url:     photo.largest.source_url,
      original_width:   photo.largest.width,
      original_height:  photo.largest.height,

      medium_url:       photo.medium(500).source_url,
      medium_width:     photo.medium(500).width,
      medium_height:    photo.medium(500).height,

      thumbnail_url:    photo.small(240).source_url,
      thumbnail_width:  photo.small(240).width,
      thumbnail_height: photo.small(240).height,

      title:            photo.title,
      stored_on:        "flickr",
    }
  end)
  primary_photo = photos.find(set.primary_photo.id)
  album.update_attributes(cover_photo: album.photos.find_by_uid(primary_photo.id))
  instance_variable_set(album_variable, album)
end
