class RegistrationsController < Devise::RegistrationsController
 
private
  def sign_up_params
    params.require(:user).permit( :email, :password, :password_confirmation , :role_type_id, :username, :avatar_cache)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password , :role_type_id , :username, :avatar_cache)
  end
  
end