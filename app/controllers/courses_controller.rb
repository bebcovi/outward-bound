class CoursesController < ApplicationController
  before_filter :set_courses

  def index
  end
  caches_action :index

  def show
    @course = COURSES.find { |course| course.to_param == params[:id] }
  end
  caches_action :show

  private

  def set_courses
    @courses = {
      "one"   => COURSES.select(&:one_day?),
      "eight" => COURSES.select(&:eight_days?),
      "other" => COURSES.select(&:other?),
    }
  end

  def sub_layout
    "courses"
  end
end
