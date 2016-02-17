class RegistrationsController < Devise::RegistrationsController
  
  def after_inactive_sign_up_path_for(resource_or_scope)
    session["user_return_to"] || root_path
  end
  
  def create
    build_resource(sign_up_params)

    if resource.save
        yield resource if block_given?
        if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_flashing_format?
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
        else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
    else
        clean_up_passwords resource
        resource.errors.full_messages.each {|x| flash[x] = x} # Rails 4 simple way
        if  params[:user][:role_type_id].to_i == 1
          redirect_to new_user_registration_path + '?type=individual'
        else
          redirect_to new_user_registration_path + '?type=business'
        end
    end
  end
 
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