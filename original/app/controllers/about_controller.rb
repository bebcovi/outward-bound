class AboutController < ApplicationController
  before_filter do
    @contents = Content.by_controller("about")
  end

  def index
    @content = Content.find_by_uid("about/index")
  end

  def what
    @content = Content.find_by_uid("about/what")
  end

  def international
    @content = Content.find_by_uid("about/international")
  end

  def instructors
    @content = Content.find_by_uid("about/instructors")
  end

  def support
    @content = Content.find_by_uid("about/support")
  end

  def safety
    @content = Content.find_by_uid("about/safety")
  end

  def contact
    @content = Content.find_by_uid("about/contact")
  end

  def locations
    @content = Content.find_by_uid("about/locations")
  end

  def partners
    @content = Content.find_by_uid("about/partners")
  end

  def applying
    @content = Content.find_by_uid("about/applying")
  end
end
