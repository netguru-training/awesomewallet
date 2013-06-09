class SessionsController < ApplicationController

  def new
    redirect_to '/auth/google_oauth2'
  end


  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_with_omniauth(auth)
    if @identity.nil?
      @identity = Identity.create_with_omniauth(auth)
    end
    if signed_in?
      if @identity.user == current_user
        redirect_to transactions_path, notice: "Already linked that account!"
      else
        @identity.user = current_user
        @identity.save
        redirect_to transactions_path, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_to transactions_path, notice: "Signed in!"
      else
        self.current_user = User.create_with_omniauth(auth) 
        redirect_to transactions_path
      end
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
