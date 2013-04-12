require "flickr-objects"
require "delegate"

class FlickrClient < SimpleDelegator
  def initialize
    Flickr.configure do |config|
      config.api_key             = API_KEY
      config.shared_secret       = SHARED_SECRET
      config.access_token_key    = ACCESS_TOKEN_KEY
      config.access_token_secret = ACCESS_TOKEN_SECRET
      config.open_timeout        = 6
      config.timeout             = 9
    end

    super(Flickr)
  end

  def person_id
    PERSON_ID
  end

  API_KEY             = ENV["FLICKR_API_KEY"]
  SHARED_SECRET       = ENV["FLICKR_SHARED_SECRET"]
  ACCESS_TOKEN_KEY    = ENV["FLICKR_ACCESS_TOKEN_KEY"]
  ACCESS_TOKEN_SECRET = ENV["FLICKR_ACCESS_TOKEN_SECRET"]
  PERSON_ID           = ENV["FLICKR_USER_ID"]
end
