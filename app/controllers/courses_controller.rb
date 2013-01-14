class CoursesController < ApplicationController
  before_filter :set_courses

  def index
  end
  caches_action :index

  def show
    @course = Course.find(params[:id])
  end
  caches_action :show

  def apply
  end
  caches_action :apply

  def application
    send_file "#{Rails.root}/public/files/Application_form_#{I18n.locale}.doc",
      filename: "Application_form.doc", type: :doc, disposition: "attachment"
  end

  private

  def set_courses
    @courses = ["one", "eight", "other"].inject({}) do |hash, category|
      hash.update(category => Course.where(category: category))
    end
  end

  def sub_layout
    "courses"
  end
end
