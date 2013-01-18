class PostsController < ApplicationController
  def index
    @posts = Post.in_language(I18n.locale).paginate(page: params[:page], per_page: 4)
  end

  def show
    @post = Post.find(params[:id])
  end
end
