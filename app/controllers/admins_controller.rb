class AdminsController < ApplicationController
  before_filter :authenticate_admin

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.save
    flash[:notice] = "#{@admin.email} added to the list of admins."
    redirect_to admin_show_path
  end

  def show
    @admin = current_admin
  end

  def index
    @admins = Admin.all
  end

  def delete
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to admins_path
  end

  protected

  def admin_params
    params.require(:admin).permit(:email).merge(password: "testtest", password_confirmation: "testtest")
  end

end