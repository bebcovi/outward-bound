# encoding: utf-8

class CategoriesController < ApplicationController
  before_filter :authenticate!
  before_filter :store_referer!, only: :index # Overwritten in this controller

  def index
    @categories = Category.of_courses
  end

  def new
    @category = Category.new
    extract_object_from_referer
  end

  def create
    @category = Category.create(params[:category])

    if @category.valid?
      redirect_to categories_path, notice: "Kategorija uspješno stvorena."
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: "Kategorija uspješno izmijenjena."
    else
      render :edit
    end
  end

  def destroy
    if Category.destroy(params[:id])
      redirect_to :back, notice: "Kategorija uspješno izbrisana."
    else
      redirect_to :back, alert: "Ova kategorija se ne može izbrisati."
    end
  end

  private

  def extract_object_from_referer
    @category.object = back[:controller].singularize
  end

  def store_referer!
    if url_to_hash(request.referer)[:controller] != params[:controller]
      session[:referer] = url_to_hash(request.referer)
    end
  end
end
