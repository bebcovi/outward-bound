class CoursesController < ApplicationController
  before_filter :set_courses

  def index
  end

  def show
    @course = Course.find(params[:id])
  end

  def apply
  end

  def application
    send_file "#{Rails.root}/public/files/Application_form_#{I18n.locale}.doc",
      filename: "Application_form.doc", type: :doc, disposition: "attachment"
  end

  private

  def sub_layout
    "courses"
  end

  def set_courses
    @kayak_adventure = Course.find("sea-kayak-adventure")
  end
end
