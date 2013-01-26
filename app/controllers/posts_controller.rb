class PostsController < ApplicationController
  def index
    @posts = Post.available_in(current_language).descending.paginate(page: params[:page], per_page: 4)
  end
  caches_action :index

  def show
    @post = Post.find(params[:id])
  end
  caches_action :show
end
