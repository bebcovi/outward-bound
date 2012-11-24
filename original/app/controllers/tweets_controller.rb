# encoding: utf-8

class TweetsController < ApplicationController
  before_filter :authenticate!
  before_filter :store_referer!, only: :index

  def index
    @tweets = Tweet.all
  end

  def stream
    @tweets = Tweet.mentions.paginate(page: params[:page], per_page: 10)
  end

  def create
    @tweet = Tweet.create!(params[:tweet])
    redirect_to :back, notice: "Tweet je dodan."
  end

  def destroy
    Tweet.destroy(params[:id])
    redirect_to :back, notice: "Tweet je izbrisan."
  end

  private

  def store_referer!
    if url_to_hash(request.referer)[:controller] != params[:controller]
      session[:referer] = url_to_hash(request.referer)
    end
  end
end
