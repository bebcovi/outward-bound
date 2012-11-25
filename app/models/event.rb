require "flickr-objects"

class Event
  def self.all
    flickr_user.get_sets.map { |flickr_set| new(flickr_set) }
  end

  def self.find(id)
    new(flickr_user.get_sets.find(id))
  end

  def initialize(flickr_set)
    @flickr_set = flickr_set
  end

  def photos
    @photos ||= @flickr_set.get_photos(sizes: :all).map(&:medium640!).sort_by(&:title)
  end

  def to_param
    id
  end

  def method_missing(*args, &block)
    @flickr_set.send(*args, &block)
  end

  private

  def self.flickr_user
    Flickr.people.find(ENV["FLICKR_USER_ID"])
  end
end
