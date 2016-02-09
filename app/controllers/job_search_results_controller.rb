class JobSearchResultsController < ApplicationController
  def index
    @job_posts = JobPost.advancesearch(params[:keyword],params[:countrysearch], params[:datesearch]).paginate(:page => params[:page], :per_page => 5).order('id DESC')
    @countries = Country.all
  end
end
