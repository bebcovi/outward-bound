class CoursesController < ApplicationController
  before_filter :set_courses

  def index
  end

  def show
    render params[:course].underscore
  end

  private

  def set_courses
    @courses = {
      "one_day_courses"   => ["high_wires"],
      "eight_day_courses" => ["sailing_adventure", "kayak_adventure", "velebit_adventure", "multi_element_adventure"],
      "technical_courses" => ["sport_climbing", "rock_climbing", "scuba_diving"]
    }
  end

  def sub_layout
    "courses"
  end
end
