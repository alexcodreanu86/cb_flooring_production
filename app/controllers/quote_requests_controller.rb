class QuoteRequestsController < ApplicationController
  before_filter :authenticate_admin, only: [:edit, :delete, :update, :index, :show]

  def new
    @quote_request = QuoteRequest.new
  end

  def create
    @quote_request = QuoteRequest.new(quote_params)
    if @quote_request.save
      render "confirmation"
    else
      @errors = @quote_request.errors.messages
      render "new"
    end
  end

  def index
    @called_quotes = QuoteRequest.where(status: true)
    @new_quotes = QuoteRequest.where(status: false)
  end

  def change_status
    @quote_request = QuoteRequest.where(id: params[:id]).first
    @quote_request.status = !@quote_request.status
    @quote_request.save
    redirect_to @quote_request
  end
  
  def show
    @quote_request = QuoteRequest.where(id: params[:id]).first
  end


  def destroy
    @quote_request = QuoteRequest.where(id: params[:id]).first
    @quote_request.destroy
    redirect_to quote_requests_path
  end

  protected

  def quote_params
    params.require(:quote_request).permit(:phone, :name, :message)
  end

  def authenticate_admin
    if !(current_admin)
      flash[:warning] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end
end