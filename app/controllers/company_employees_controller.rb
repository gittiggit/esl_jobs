class CompanyEmployeesController < InheritedResources::Base
  
  def create
  @employees_new_id  = User.find_by(:username => params[:employee_name])
  
  if @employees_new_id.blank?
    @employees_new_id  = User.find_by(:email => params[:employee_name])
  end
  
  @company_employee = CompanyEmployee.new(company_employee_params)
 
  if @company_employee.save
  redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  private

    def company_employee_params
      unless @employees_new_id.blank?
      params.require(:company_employee).permit(:user_id, :employee_id, :employee_name).merge(:employee_id => @employees_new_id.id, :user_id => current_user.id )
      end
    end
end

