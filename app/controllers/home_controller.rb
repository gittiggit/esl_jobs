class HomeController < ApplicationController
  def index
       @job_posts = JobPost.all
  end
end