class CommentsController < ApplicationController
  def create
    @comment = Contact.new(comment_params)
    @comment.job_id = params[:job_id]
    @comment.save
    redirect_to job_path(@comment.job)
  end

  def edit
    @comment = Comment.find(params[:id])
    @job = @comment.job
  end

  def destroy
    job = Job.find(params[:id])
    comment = Comment.find(params[:id])
    comment.destroy

    flash[:success] = "#{contact.name} was successfully deleted."
    redirect_to job_path(job)
  end

  def update
    @comment = Comment.find(params[:id])
    job = @comment.job
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = "#{@comment.name} updated!"
      redirect_to job_path(job)
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:timestamps, :body)
  end
end