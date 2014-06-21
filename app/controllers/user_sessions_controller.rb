class UserSessionsController < ApplicationController

  respond_to :html

  def new
  end

  def create
    user = User.create_with(name: auth_hash.info.name).find_or_create_by!(facebook_id: auth_hash.uid)
    if user.persisted?
      session[:user_id] = user.id 
      redirect_to main_path
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to new_user_session_path
  end

protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
