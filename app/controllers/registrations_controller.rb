class RegistrationsController < Devise::RegistrationsController
private
  def sign_up_params
    params.require(:user).permit( :email, :password, :password_confirmation , :role, :username, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password , :role , :username, :avatar)
  end
  
end