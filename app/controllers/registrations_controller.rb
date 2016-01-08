class RegistrationsController < Devise::RegistrationsController
 
private
  def sign_up_params
    params.require(:user).permit( :email, :username, :first_name, :last_name, :citizenship , :businessname, :city, :country, 	:address, :about, :telephone, :website, :otherlocation, :birthdate, :introduction, :employees, 	:locationmap, :locationdescription, :skills, :language, :avatar, :avatar_cache, :password, :password_confirmation, :current_password, :role_type_id)
  end

  def account_update_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :citizenship, :businessname, :city, :country, 	:address, :about, :telephone, :website, :otherlocation, :birthdate, :introduction, :employees, 	:locationmap, :locationdescription, :skills, :language, :avatar, :avatar_cache, :password, :password_confirmation, :current_password, :role_type_id)
  end
  

end