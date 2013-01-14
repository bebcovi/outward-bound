class AboutController < ApplicationController
  before_filter :set_about_pages

  def index
  end
  caches_action :index

  def what
  end
  caches_action :what

  def international
  end
  caches_action :international

  def instructors
  end
  caches_action :instructors

  def support
  end
  caches_action :support

  def safety
  end
  caches_action :safety

  def locations
  end
  caches_action :locations

  def partners
  end
  caches_action :partners

  private

  def sub_layout
    "about"
  end

  def set_about_pages
    @about_pages = [:index, :what, :international, :instructors, :support, :safety, :locations, :partners]
  end
end
