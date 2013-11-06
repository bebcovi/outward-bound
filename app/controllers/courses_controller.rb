class CoursesController < ApplicationController
  before_filter :load_categories

  def index
  end

  def show
    @course =
      if params[:category_id]
        category = Category.find(params[:category_id])
        category.courses.find_by!(slug: params[:id])
      else
        Course.find(params[:id])
      end
    @course = @course.decorate
  end

  private

  def load_categories
    @categories = Category.decorate
  end

  def sub_layout
    "courses"
  end
end
