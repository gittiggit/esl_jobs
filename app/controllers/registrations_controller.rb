class RegistrationsController < Devise::RegistrationsController
 
private
  def sign_up_params
    if params[:user][:role_type_id].to_i == 1
      new_username = params[:user][:first_name].split.join.to_s + params[:user][:last_name].split.join.to_s + (5...30).sort_by{rand}[2].to_s
    else
      new_username = params[:user][:businessname].split.join.to_s + (5...30).sort_by{rand}[2].to_s
    end  

    params.require(:user).permit( :email, :username, :first_name, :last_name, :citizenship , :businessname, :city, :country, 	:address, :about, :telephone, :website, :otherlocation, :birthdate, :introduction, :employees, 	:locationmap, :locationdescription, :skills, :language, :avatar, :avatar_cache, :password, :password_confirmation, :current_password, :role_type_id).merge(:username => new_username)
  end

  def account_update_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :citizenship, :businessname, :city, :country, 	:address, :about, :telephone, :website, :otherlocation, :birthdate, :introduction, :employees, 	:locationmap, :locationdescription, :skills, :language, :avatar, :avatar_cache, :password, :password_confirmation, :current_password, :role_type_id)
  end
  

end