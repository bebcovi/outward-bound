class PhotosController < ApplicationController
  def index
    @photoset = Photoset.find(params[:photoset_id])
    @photos = @photoset.photos
  end
end
