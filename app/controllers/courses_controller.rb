class CoursesController < ApplicationController
  before_filter :load_categories

  def index
  end

  def show
    @course = COURSES.find { |course| course.to_param == params[:id] }
  end

  private

  def load_categories
    @categories = Category.decorate
  end

  def sub_layout
    "courses"
  end
end
