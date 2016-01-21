class ExperiencesController < InheritedResources::Base
  
  def create
    @experience = Experience.new(experience_params)
   
    if @experience.save
        redirect_to user_path(current_user)
      else
        redirect_to user_path(current_user)
    end
  end

  private

    def experience_params
      params.require(:experience).permit(:title, :company_name, :year_experiences, :job_details).merge(:user_id => current_user.id)
    end
end

