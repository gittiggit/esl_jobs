class HomeController < ApplicationController
  def index
       @job_posts = JobPost.all
       @countries = Country.all
       @job_types= JobType.all
  end
end