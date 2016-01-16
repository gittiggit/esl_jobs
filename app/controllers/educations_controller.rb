class EducationsController < InheritedResources::Base

  private

    def education_params
      params.require(:education).permit(:school, :degree, :date, :user_id).merge(:user_id => current_user.id)
    end
end

