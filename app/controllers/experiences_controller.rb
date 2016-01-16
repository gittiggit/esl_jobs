class ExperiencesController < InheritedResources::Base

  private

    def experience_params
      params.require(:experience).permit(:title, :company_name, :year_experiences, :job_details).merge(:user_id => current_user.id)
    end
end

