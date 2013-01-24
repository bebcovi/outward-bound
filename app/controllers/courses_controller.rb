class CoursesController < ApplicationController
  before_filter :set_courses

  def index
  end
  caches_action :index

  def show
    @course = Course.find(params[:id])
  end
  caches_action :show

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
