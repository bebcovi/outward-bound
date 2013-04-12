# encoding: utf-8

class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.descending.paginate(page: params[:page], per_page: 4)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    photos_attributes = params[:post].delete(:photos_attributes) || {}
    @post.assign_attributes(params[:post])

    if @post.valid? and photos_attributes[:cover].present?
      begin
        remaining = ActiveRecord::Base.transaction do
          @post.save
          PhotosCreator.new(@post).create_photos(photos_attributes)
        end
        redirect_to admin_posts_path, notice: "Vijest je uspješno stvorena. Preostalo mjesta na Flickr-u za ovaj mjesec: #{remaining} MB."
      rescue Flickr::TimeoutError
        @post.errors.add(:photos_attributes, "Spremanje slika nije uspjelo. Probajte ponovno.")
        render :new
      end
    else
      @post.errors.add(:photos_attributes, "Vijest mora imati barem naslovnu sliku.") if photos_attributes[:cover].blank?
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    photos_attributes = params[:post].delete(:photos_attributes) || {}
    @post.assign_attributes(params[:post])

    if @post.valid?
      begin
        @post.save
        remaining = PhotosCreator.new(@post).create_photos(photos_attributes)
        redirect_to admin_posts_path, notice: "Vijest je uspješno izmijenjena. Preostalo mjesta na Flickr-u za ovaj mjesec: #{remaining} MB."
      rescue Flickr::TimeoutError
        @post.errors.add(:photos_attributes, "Spremanje slika nije uspjelo. Probajte ponovno.")
        render :new
      end
    else
      render :edit
    end
  end

  def destroy
    if Post.exists?(params[:id])
      post = Post.destroy(params[:id])
      AlbumDeleter.new(post.album).delete
    end
    redirect_to admin_posts_path, notice: "Vijest je uspješno izbrisana."
  end
end
