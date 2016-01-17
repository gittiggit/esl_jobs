class CompanyEmployeesController < InheritedResources::Base

  private

    def company_employee_params
      params.require(:company_employee).permit(:user_id, :employee_id)
    end
end

