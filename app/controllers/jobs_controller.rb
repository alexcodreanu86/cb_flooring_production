class JobsController < ApplicationController
  before_filter :authenticate_admin

  def show
    @job = Job.where(id: params[:id]).first
    @customer = @job.customer
  end

  def index
    @jobs = Job.all.order(completed_at: :desc).includes(:customer)
  end

  def new
    @customer = Customer.where(id: params[:customer_id]).first
    @job = Job.new
  end

  def create
    @customer = Customer.where(id: params[:customer_id]).first
    @job = Job.new(job_params.merge(customer_id: params[:customer_id]))
    if @job.save
      flash[:notice] = "Job created successfuly"
      redirect_to @customer
    else
      @errors = @jobs.errors.messages
      render "new"
    end
  end

  def edit
    @job = Job.where(id: params[:id]).first
  end

  def update

    @job = Job.where(id: params[:id]).first
    @job.update(job_params)

    if @job.save
      flash[:notice] = "Job updated successfuly"
      redirect_to customer_path(@job.customer_id)
    else
      @errors = @jobs.errors.messages
      render "edit"
    end
  end

  def destroy
    @job = Job.where(id: params[:id]).first
    @job.destroy
    flash[:notice] = "Job deleted successfuly"
    redirect_to customer_path(@job.customer_id)
  end

  protected

  def job_params
    params.require(:job).permit(:completed_at, :address, :description)
  end
end