require_relative "../../lib/flickr_client"

class PhotosCreator
  def initialize(post)
    @post = post
  end

  def create_photos(photos_attributes)
    album = create_or_update_album(photos_attributes)
    @post.update_attributes(album: album)
    flickr.people.get_upload_status.current_month.remaining
  end

  private

  def create_or_update_album(hash)
    photo_uids = upload_photos([hash[:cover], *hash[:other]].reject(&:blank?))
    photos = get_photos(photo_uids)
    album = @post.album || Album.create!
    album.photos.create!(photos.map { |photo| photo_hash(photo) })
    album.update_attributes(cover_photo: album.photos.find_by_uid(photo_uids.first)) if hash[:cover].present?
    delete_existing_photos(album, photo_uids)
    album
  end

  def upload_photos(files)
    files.map do |file|
      title = file.original_filename.match(/\.\w+$/).pre_match
      flickr.upload(file, title: title)
    end
  end

  def get_photos(photo_uids)
    person = flickr.people.find(flickr.person_id)
    person.get_photos(sizes: :all, min_upload_date: 2.hours.ago.to_i).find(photo_uids)
  end

  def photo_hash(photo)
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
  end

  def delete_existing_photos(album, photo_uids)
    if photo_uids.count >= 2
      album.photos.where("photos.uid NOT IN (?)", photo_uids + [album.cover_photo.uid]).each do |photo|
        photo.destroy
        flickr.photos.delete(photo.uid)
      end
    end
  end

  def flickr
    @flickr ||= FlickrClient.new
  end
end
