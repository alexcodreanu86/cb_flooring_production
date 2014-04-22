class CustomersController < ApplicationController
  before_filter :authenticate_admin

  def show

  end

  def index

  end

  def new
    @customer = Customer.new
    if params[:quote_request_id] 
      quote_request = QuoteRequest.find(params[:quote_request_id])
      @customer.name = quote_request.name
      @customer.phone = quote_request.phone
    end
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected

  def customer_params
    params.require(:customer).permit(:name, :address, :email, :phone)
  end

end