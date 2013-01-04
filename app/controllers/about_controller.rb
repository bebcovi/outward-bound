class AboutController < ApplicationController
  before_filter :set_about_pages

  def index
  end

  def what
  end

  def international
  end

  def instructors
  end

  def support
  end

  def safety
  end

  def locations
  end

  def partners
  end

  private

  def sub_layout
    "about"
  end

  def set_about_pages
    @about_pages = self.class.action_methods
  end
end
