class EmployeeSearchResultsController < ApplicationController
  def index
    @users = User.teacher_search(params[:keyword], params[:countrysearch] ).paginate(:page => params[:page], :per_page => 10).where(:role_type_id => 1)
    @countries = Country.all
  end


end
