class AlbumsController < ApplicationController
  def index
    @albums = Album.all.decorate
  end

  def show
    @album = Album.find(params[:id]).decorate
  end
end
