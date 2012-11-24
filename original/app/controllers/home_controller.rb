class HomeController < ApplicationController
  def index
    @posts = Post.limit(10)
    @content = Content.find_by_uid("home/index")
  end

  def archive
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end
end
