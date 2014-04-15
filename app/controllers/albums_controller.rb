class AlbumsController < ApplicationController
  before_filter :authenticate_admin, only: [:new, :create, :edit, :delete, :update, :admin_index, :admin_show]

  def admin_index
    @albums = Album.all.order(:created_at).reverse_order
  end

  def admin_show
    @album = Album.where(id: params[:id]).first
    @images = @album.images.order(:order)
    redirect_to root_path unless @album
  end

  def index
    @albums = Album.all.order(:created_at).reverse_order
    if request.xhr?
      render partial: "albums/index_partial"
    end
  end

  def show
    @album = Album.where(id: params[:id]).first
    @images = @album.images.order(:order)
    redirect_to root_path unless @album
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_admin_show_path(@album)
    else
      @errors = @album.errors.messages
      render "new"
    end
  end

  def edit
    @album = Album.where(id: params[:id]).first
  end

  def update
    @album = Album.where(id: params[:id]).first
    @album.update(album_params)
    if @album.save
      redirect_to @album
    else
      @errors = @album.errors.messages
      render "edit"
    end
  end

  def destroy
    @album = Album.where(id: params[:id]).first
    @album.destroy
    redirect_to albums_path
  end



  protected

  def album_params
    params.require(:album).permit(:title, :description)
  end

  def authenticate_admin
    if !(current_admin)
      flash[:warning] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end
end