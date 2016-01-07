class JobPostsController < ApplicationController
  def index
    @job_posts = JobPost.search(params[:jobsimplesearch],params[:countrysearch]).paginate(:page => params[:page], :per_page => 39,:order => "updated_at DESC" , total_entries: 100)

    @countries = Country.all
    @user = User.all
    @individualusers = User.where( :role_type_id => 1).limit(4)
    @businessusers = User.where( :role_type_id => 2).limit(3)
  end

  def new
   @countries = Country.all
   @title="Add Jobs"
   @job_post = JobPost.new
  end

  def create
  @job_post = JobPost.new(job_post_params)
 
  if @job_post.save
  redirect_to @job_post
    else
      render 'new'
    end
  end
  
  def edit
  @job_post = JobPost.friendly.find(params[:id])
  end
  
  def show
  @user = User.all
  @countries = Country.all
  @job_types = JobType.all
  @job_post = JobPost.friendly.find(params[:id])
  @userjobpost = JobPost.where(:user_id => @job_post.user_id)
  end

  def update
  @job_post = JobPost.friendly.find(params[:id])
  if @job_post.update(job_post_params)
    redirect_to @job_post
  else
    render 'edit'
  end
  end

  def destroy
  @job_post = JobPost.friendly.find(params[:id])
  @job_post.destroy
  redirect_to job_posts_path
  end

  private
  def job_post_params
  params.require(:job_post).permit(:title, :description, :city  , :jobslink, :salary, :company, :country_id , :job_type_id, :user_id).merge(:user_id => current_user.id)
  end
  
end
