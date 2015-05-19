class UsersController < ApplicationController
    before_filter :authenticate_user!
  def show
    @user = User.friendly.find(params[:id])
  end
end
