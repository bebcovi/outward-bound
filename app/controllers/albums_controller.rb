class AlbumsController < ApplicationController
  def index
    @albums = Album.where(category: "course")
  end
  caches_action :index

  def show
    @album = Album.where(category: "course").find(params[:id])
  end
  caches_action :show
end
