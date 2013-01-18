class AlbumsController < ApplicationController
  def index
    @albums = Album.where(event_type: "Course")
  end
  caches_action :index

  def show
    @album = Album.where(event_type: "Course").find(params[:id])
  end
  caches_action :show
end
