class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :mailbox, :conversation
  
  def after_sign_in_path_for(resource)
    user_path(current_user) #your path
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end
  

end
