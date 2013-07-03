class PostsController < ApplicationController
  def index
    @posts = Post
      .available_in(current_locale)
      .paginate(page: params[:page], per_page: 4)
    @posts = PaginationDecorator.decorate(@posts)
  end

  def show
    @post = Post.find(params[:id]).decorate
  end
end
