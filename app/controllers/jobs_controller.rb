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
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @job = @company.jobs.new(job_params)
        if @job.save
          flash[:success] = "You created #{@job.title} at #{@job.company}"
          redirect_to company_job_path(@company, @job)
        else
          render :new
        end
    else
      @job = Job.new(job_params)
      if @job.save
        flash[:success] = "You created #{@job.title} at #{@job.company.name}"
        redirect_to job_path(@job)
      else
        render :new
      end
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
    if params[:company_id]
      company = Company.find(params[:company_id])
      job = Job.find(params[:id])
      job.destroy

      flash[:success] = "#{job.title} was successfully deleted."
      redirect_to company_jobs_path(company)
    else
      job = Job.find(params[:id])
      job.destroy
      flash[:success] = "#{job.title} was successfully deleted."
      redirect_to jobs_path(job)
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end

end
