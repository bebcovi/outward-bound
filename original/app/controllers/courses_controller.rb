# encoding: utf-8

class CoursesController < ApplicationController
  before_filter :authenticate!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :store_referer!, only: [:new, :edit]

  def index
    @content = Content.find_by_uid("courses/index")
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(params[:course])

    if @course.valid?
      redirect_to @course, notice: "Program uspješno stvoren."
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to @course, notice: "Program uspješno izmjenjen."
    else
      render :edit
    end
  end

  def destroy
    Course.destroy(params[:id])
    redirect_to courses_path, notice: "Program je uspješno izbrisan."
  end
end
