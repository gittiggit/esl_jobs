class JobSearchResultsController < ApplicationController
  def index
    @job_posts = JobPost.advancesearch(params[:keyword],params[:countrysearch]).paginate(:page => params[:page], :per_page => 5,:order => "updated_at DESC" )
    @countries = Country.all
  end
end
