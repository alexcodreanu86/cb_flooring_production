class AlbumsController < ApplicationController
  before_filter :authenticate_admin, only: [:new, :create, :edit, :delete, :update, :index]

  def show
  end

  def new
    @album = Album.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def index
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