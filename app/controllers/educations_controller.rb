class EducationsController < InheritedResources::Base
  
  def create
  @education = Education.new(education_params)
 
  if @education.save
      redirect_to user_path(current_user) + '?back_to=eresume'
    else
      redirect_to user_path(current_user) + '?back_to=eresume'
    end
  end

  private

    def education_params
      params.require(:education).permit(:school, :degree, :date, :user_id).merge(:user_id => current_user.id)
    end
end

