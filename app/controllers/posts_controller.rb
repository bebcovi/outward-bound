class PostsController < ApplicationController
  def index
    @posts = Post.descending
      .available_in(current_locale)
      .paginate(page: params[:page], per_page: 4)
    @posts = PaginationDecorator.decorate(@posts)
  end

  def show
    @post = Post.find(params[:id]).descorate
  end
end
