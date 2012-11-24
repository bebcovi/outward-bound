# encoding: utf-8

class ContentsController < ApplicationController
  before_filter :authenticate!

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])

    if @content.update_attributes(params[:content])
      redirect_to @content.url_hash
    else
      render :edit
    end
  end
end
