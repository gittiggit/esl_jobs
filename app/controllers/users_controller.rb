class UsersController < ApplicationController
   # before_filter :authenticate_user!
    respond_to :html, :json

  def show
    @user = User.friendly.find(params[:id])
    @pictures = Picture.where(:user_id => @user.id)
    @picture  = Picture.new
    @videos = Video.where(:user_id => @user.id)
    @video  = Video.new
    @reviews = Review.where(:review_to => @user.id)
    @review = Review.new
    @education = Education.new
    @company_employee = CompanyEmployee.new
    @educations = Education.where(:user_id => @user.id)
    @experience = Experience.new
    @experiences = Experience.where(:user_id => @user.id)
    @userid = @user.id
    @company_employees = CompanyEmployee.where(:user_id => @user.id)
    params[:type] = "individual"
    @roleid = RoleType.find_by( :name => params[:type] )
    @job_posts = JobPost.where(:user_id => @userid)
    
    if params[:back_to] == 'pictures'
      @back_pictures = 'active'
    elsif params[:back_to] == 'reviews'
      @back_reviews = 'active'
    elsif params[:back_to] == 'employees'
      @back_employees = 'active'
    elsif params[:back_to] == 'eresume'
      @back_eresume = 'active'
      else
      @back_main = 'active'  
    end
    
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
      params.require(:user).permit(:email, :username, :first_name, :citizenship , :last_name, :businessname, :city, :country, 	:address, :about, :telephone, :website, :otherlocation, :birthdate, :introduction, :employees, 	:locationmap, :locationdescription, :skills, :language, :avatar, :avatar_cache , :password, :password_confirmation, :current_password) 
    end
 end

end
