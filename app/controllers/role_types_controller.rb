class RoleTypesController < InheritedResources::Base

  private

    def role_type_params
      params.require(:role_type).permit(:name)
    end
end

