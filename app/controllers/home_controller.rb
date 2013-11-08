class HomeController < ApplicationController
  def index
       @job_posts = JobPost.all
       @countries = Country.all
  end
end