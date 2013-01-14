class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end
  caches_action :index

  def show
    @album = Album.find(params[:id])
  end
  caches_action :show
end
