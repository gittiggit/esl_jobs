class JobSearchResultsController < ApplicationController
  def index
    @job_posts = JobPost.search(params[:jobsimplesearch],params[:countrysearch]).paginate(:page => params[:page], :per_page => 39,:order => "updated_at DESC" , total_entries: 100)
  end
end
