class PostsController < ApplicationController
  def index
    @posts = Post.in_language(I18n.locale).order("created_at DESC").paginate(page: params[:page], per_page: 4)
  end

  def show
    @post = Post.find(params[:id])
  end
end
