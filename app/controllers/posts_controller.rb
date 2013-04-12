class PostsController < ApplicationController
  def index
    @posts = Post.available_in(current_language).descending.paginate(page: params[:page], per_page: 4)
  end

  def show
    @post = Post.find(params[:id])
  end
end
