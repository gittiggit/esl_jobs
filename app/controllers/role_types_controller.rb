class RoleTypesController < InheritedResources::Base

respond_to :html, :json


  private

    def role_type_params
      params.require(:role_type).permit(:name)
    end
    
    
end

