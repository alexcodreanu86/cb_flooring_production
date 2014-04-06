class AlbumsController < ApplicationController
  before_filter :authenticate_admin, only: [:new, :create, :edit, :delete, :update, :index]

  def show
    @album = Album.where(id: params[:id]).first
    redirect_to root_path unless @album
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      @errors = @album.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def index
    @albums = Album.all.order(:created_at).reverse_order
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