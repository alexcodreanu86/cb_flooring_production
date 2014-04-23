class CustomersController < ApplicationController
  before_filter :authenticate_admin

  def show
    @customer = Customer.where(id: params[:id]).first
    @jobs = @customer.jobs
    if !@customer
      flash[:alert] = "Invalid link"
      redirect_to root_path
    end
  end

  def index
    @customers = Customer.all.order(:name)
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
    @customer = Customer.new(customer_params)
    @customer.update_phone_number

    if @customer.save
      redirect_to @customer
    else
      @errors = @customer.errors.messages
      render "new"
    end
  end

  def edit
    @customer = Customer.where(id: params[:id]).first
    if !@customer
      flash[:alert] = "No customer found with id #{params[:id]}!"
      redirect_to root_path
    end
  end

  def update
    @customer = Customer.where(id: params[:id]).first
    @customer.update(customer_params)
    if @customer.save
      redirect_to @customer
    else
      @errors = @customer.errors.messages
      render "edit"
    end
  end

  def destroy
    @customer = Customer.where(id: params[:id]).first
    @customer.destroy
    flash[:notice] = "#{@customer.name} has been deleted from your customers list."
    redirect_to customers_path
  end

  protected

  def customer_params
    params.require(:customer).permit(:name, :address, :email, :phone)
  end

end