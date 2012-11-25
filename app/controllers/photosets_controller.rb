class PhotosetsController < ApplicationController
  def index
    @photosets = Photoset.all
  end
end
