class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 

  def authenticate_admin
    if !(current_admin)
      flash[:alert] = "You are either not authorized to view this page or it doesn't exist!"
      redirect_to root_path
    end
  end
end
