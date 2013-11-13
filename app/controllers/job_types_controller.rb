class JobTypesController < ApplicationController
 def index
     @job_types= JobType.all
  end
  def new
  @title="Add Jobs"
  @job_type = JobType.new
  end

  def create
  @job_type = JobType.new(job_type_params)
  if @job_type.save
  redirect_to @job_type
  else
    render 'new'
  end
  end
    
  def show
  @job_type = JobType.find(params[:id])
  end
  
  def edit
  @job_type = JobType.find(params[:id])
  end
  
  def update
  @job_type = JobType.find(params[:id])
  if @job_type.update(job_type_params)
    redirect_to @job_type
  else
    render 'edit'
  end
  end

  def destroy
  @job_type = JobType.find(params[:id])
  @job_type.destroy
  redirect_to job_types_path
  end

  private
  def job_type_params
  params.require(:job_type).permit(:type_title)
  end
end