class AccountController < ApplicationController
  def index
  if params[:token] == Rails.application.secrets.account_secret
    @email = params[:email]
    @username = params[:username]
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @country = params[:country]
    @password = "Changeme123"
    @role_id = 1
    newuser = User.new({email: @email, username: @username ,first_name:  @first_name, last_name: @last_name, country: @country , password: @password , password_confirmation: @password, role_type_id: @role_id})
    newuser.skip_confirmation!
    if newuser.save
    @status = "created";
      else
    @status = "error"
    end
      
  else
    @status = "token mismatch" 
  end
  
  @status_json = ActiveSupport::JSON.encode({ status: @status })
  render json: @status_json 
  end
end
