class AlbumsController < ApplicationController
  def index
    @albums = Album.where(event_type: "Course")
  end

  def show
    @album = Album.where(event_type: "Course").find(params[:id])
  end
end
