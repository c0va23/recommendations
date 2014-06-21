class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session.key?(:user_id)
  end

  def require_user!
    unless current_user
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
        format.any { head :forbidden  }
      end
    end
  end

end
