class UsersController < ApplicationController
    before_filter :authenticate_user!


  def show
    @user = User.friendly.find(params[:id])
    @reviews = Review.find_by_sql ["SELECT * FROM reviews WHERE review_to = ?", @user.id]
    @review = Review.new
    @educations = Education.find_by_sql ["SELECT * FROM educations WHERE users_id = ?", @user.id]
    @userid = @user.id
    params[:type] = "individual"
    @roleid = RoleType.find_by( :name => params[:type] )
    if @user.role_type.name == 'business'
    render 'users/business'
    else
    render 'users/individual'
    end
  end
end
