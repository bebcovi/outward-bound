class GalleriesController < ApplicationController
  def index
    @galleries = 5.times.map { |n| Gallery.new(title: "Gallery #{n + 1}") }
  end

  def show
    @gallery = Gallery.new(title: params[:gallery].humanize)
  end
end
