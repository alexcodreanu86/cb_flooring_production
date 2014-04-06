class ImagesController < ApplicationController
  before_filter :authenticate_admin, only:[:new, :index, :create, :edit, :update, :destroy]

  def index
    @album = Album.where(id: params[:album_id]).first
    @images = @album.images
  end

  def new
    @album = Album.where(id: params[:album_id]).first
    @image = Image.new
  end

  def show
    @image = Image.where(id: params[:id]).first
  end

  def create
    @image = Image.new(image_params.merge(album_id: params[:album_id]))
    if params[:image] 

      if @image.save
        redirect_to @image
      else
        @errors = @image.errors.messages
        render "new"
      end

    else
      flash[:notice]="You must upload an image"
      @image = Image.new
      render "new"
    end
  end

  def edit
    @image = Image.where(id: params[:id]).first
    unless @image
      flash[:alert]="You are not autorized on this page"
      redirect_to
    end
  end


  protected

  def image_params
    params.require(:image).permit(:image_path)
  end

  def authenticate_admin
    if !(current_admin)
      flash[:warning] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end

end