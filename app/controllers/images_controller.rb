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
    @album = Album.where(id: params[:album_id]).first
    @order_number = @album.images.count + 1
    @image = @album.images.new(new_image_params.merge(order: @order_number))

    if params[:image] 
      if @image.save
        redirect_to album_admin_show_path(@album)
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

  def update
    @image = Image.where(id: params[:id]).first
    @image.update(edit_image_params)
    @album = @image.album

    if @image.save
      redirect_to album_admin_show_path(@album)
    else
      @errors = @image.errors.messages
      render "edit"
    end
  end

  def destroy
    @image = Image.where(id: params[:id]).first
    @album = @image.album
    @album.images.order(:order).each_with_index{|image, index| image.update(order: index + 1)}
    @image.destroy
    flash[:notice] = "The image has been deleted!"
    redirect_to album_admin_show_path(@album)
  end 

  def edit
    @image = Image.where(id: params[:id]).first
    unless @image
      flash[:alert]="No such Image was found!"
      redirect_to root_path
    end
    @album = @image.album
  end


  protected

  def new_image_params
    params.require(:image).permit(:image_path, :description)
  end

  def edit_image_params
    params.require(:image).permit(:description)
  end

  def authenticate_admin
    if !(current_admin)
      flash[:warning] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end

end