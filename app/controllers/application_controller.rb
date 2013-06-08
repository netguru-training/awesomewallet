class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
    end

    def signed_in?
      
      !!current_user
    end
    helper_method :current_user, :signed_in?

    def current_user=(user)
      @current_user = user
      session[:user_id] = user.id
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end

end
