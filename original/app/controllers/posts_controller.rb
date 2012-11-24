# encoding: utf-8

class PostsController < ApplicationController
  before_filter :authenticate!, except: :index

  def index
    @posts = Post.scoped

    respond_to do |format|
      format.atom { render layout: false }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post])

    if @post.valid?
      redirect_to root_path, notice: "Vijest je uspješno stvorena."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to root_path, notice: "Vijest je uspješno izmijenjena."
    else
      render :edit
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to :back, notice: "Vijest je uspješno izbrisana."
  end
end
