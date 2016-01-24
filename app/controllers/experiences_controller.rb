class ExperiencesController < InheritedResources::Base
  
  def create
    @experience = Experience.new(experience_params)
   
    if @experience.save
        redirect_to user_path(current_user)  + '?back_to=eresume'  , notice: 'Experience details was successfully Added.'
      else
        redirect_to user_path(current_user) + '?back_to=eresume', notice: 'Something wrong.'
    end
  end
  
  def destroy
  @experience = Experience.find(params[:id])
  @experience.destroy
  redirect_to user_path(current_user) + '?back_to=eresume' , notice: 'Education details was successfully deleted.'
  end

  private

    def experience_params
      params.require(:experience).permit(:title, :company_name, :year_experiences, :job_details).merge(:user_id => current_user.id)
    end
end

