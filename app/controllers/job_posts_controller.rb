class JobPostsController < ApplicationController
  def index
  end

  def new
  @title="Add Jobs"
  end

  def create
  @job_post = JobPosts.new(job_posts_params)
  @job_post.save
  redirect_to @job_post
  end
    
  def show
  @job_post = JobPosts.find(params[:id])
  end

  private
  def job_posts_params
  params.require(:job_posts).permit(:title, :description, :city, :jobslink, :salary, :company)
  end
  
end
