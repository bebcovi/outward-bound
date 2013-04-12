# encoding: utf-8

class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.descending.paginate(page: params[:page], per_page: 4)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.assign_attributes(params[:post])

    if @post.valid?
      @post.save
      redirect_to admin_posts_path, notice: "Vijest je uspješno stvorena."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(params[:post])

    if @post.valid?
      @post.save
      redirect_to admin_posts_path, notice: "Vijest je uspješno izmijenjena."
    else
      render :edit
    end
  end

  def destroy
    Post.destroy(params[:id]) if Post.exists?(params[:id])
    redirect_to admin_posts_path, notice: "Vijest je uspješno izbrisana."
  end
end
