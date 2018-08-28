class CommentsController < ApplicationController
  def create
    @comment = Contact.new(comment_params)
    @comment.job_id = params[:job_id]
    @comment.save
    redirect_to job_path(@comment.job)
  end

  def edit

  end

  private

  def comment_params
    params.require(:comment).permit(:timestamps, :body)
  end
end