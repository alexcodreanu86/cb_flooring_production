class AlbumsController < ApplicationController
  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end


  protected

  def album_params
    params.require(:album).permit(:title, :description)
  end

  def authenticate_admin
    
  end
end