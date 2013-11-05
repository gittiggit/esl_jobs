class JobPostsController < ApplicationController
  def index
  end

  def new
  @title="Add Jobs"
  end

  def create
  @job_post = JobPost.new(job_post_params)
  @job_post.save
  redirect_to @job_post
  end
    
  def show
  @job_post = JobPost.find(params[:id])
  end

  private
  def job_post_params
  params.require(:job_post).permit(:title, :description, :city, :jobslink, :salary, :company, :country_id)
  end
  
end
