class EducationsController < InheritedResources::Base
  
  def create
  @education = Education.new(education_params)
 
  if @education.save
      redirect_to user_path(current_user) + '?back_to=eresume'  , notice: 'Education details was successfully Added.'
    else
      redirect_to user_path(current_user) + '?back_to=eresume', notice: 'Something wrong.'
    end
  end
  
  def destroy
  @education = Education.find(params[:id])
  @education.destroy
  redirect_to user_path(current_user) + '?back_to=eresume' , notice: 'Education details was successfully deleted.'
  end

  private

    def education_params
      params.require(:education).permit(:school, :degree, :date, :user_id).merge(:user_id => current_user.id)
    end
end

