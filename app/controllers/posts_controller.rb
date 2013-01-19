class PostsController < ApplicationController
  def index
    @posts = Post.in_language(I18n.locale).order("created_at DESC").paginate(page: params[:page], per_page: 4)
  end
  caches_action :index

  def show
    @post = Post.find(params[:id])
  end
  caches_action :show
end
