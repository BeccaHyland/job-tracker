class JobsController < ApplicationController
  def index
    if params[:sort] == "location"
      @jobs = Job.sort_by_location
    elsif params[:sort] == "interest"
      @jobs = Job.sort_by_interest
    elsif params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    else
      @jobs = Job.all
    end
  end

  def show
      @job = Job.find(params[:id])
      @comment = Comment.new
      @comment.job_id = @job.id
  end

  def new
      @job = Job.new
    if params[:company_id]
      @categories = Category.all
      @company = Company.find(params[:company_id])
    end
  end

  def create
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def edit
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @job = Job.find(params[:id])
    else
      @job = Job.find(params[:id])
    end
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:company_id])
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "#{job.title} was successfully deleted."
    redirect_to company_jobs_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end

  def sort_params
    if params[:sort] == "location"
      @jobs = Job.sort_by_location()
    elsif params[:sort] == "interest"
      @jobs = Job.sort_by_interest()
    end
  end
end
