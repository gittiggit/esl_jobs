class UsersController < ApplicationController
    before_filter :authenticate_user!
respond_to :html, :json

  def show
    @user = User.friendly.find(params[:id])
    @reviews = Review.find_by_sql ["SELECT * FROM reviews WHERE review_to = ?", @user.id]
    @review = Review.new
    @educations = Education.find_by_sql ["SELECT * FROM educations WHERE users_id = ?", @user.id]
    @userid = @user.id
    params[:type] = "individual"
    @roleid = RoleType.find_by( :name => params[:type] )
    @job_posts = JobPost.where(:user_id => '3')
    if @user.role_type.name == 'business'
    render 'users/business'
    else
    render 'users/individual'
    end
  end
  
  def update
  @user = User.friendly.find(params[:id])
  @user.update_attributes(device_params)
  respond_with @user
end 

 def device_params
    if params[:user]
      params.require(:user).permit(:about,:email, :businessname , :password, :password_confirmation , :role_type_id, :username, :avatar_cache)  # TODO minimize when update is working 
    end
  end

end
