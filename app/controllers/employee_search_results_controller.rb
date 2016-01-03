class EmployeeSearchResultsController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page], :per_page => 2)
  end
end
