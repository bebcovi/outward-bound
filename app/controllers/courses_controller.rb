class CoursesController < ApplicationController
  before_filter :load_categories

  def index
  end

  def show
    @course = Course.find(params[:id]).decorate
  end

  private

  def load_categories
    @categories = Category.decorate
  end

  def sub_layout
    "courses"
  end
end
