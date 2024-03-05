class SessionsController < ApplicationController

  def new
    logger.debug "Session:  #{params[:session]}"
  end

  def create

    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
       logger.debug "User is authenticated"
       log_in user
       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
       remember user
       redirect_to user
    else
      # flash[:danger] = "Invalid email/passord combination"
      flash.now[:danger] = "Invalid email/passord combination"
 
      logger.debug "User email/password not found!!!"
      render 'new'
 
    end
  end

  def destroy
       logger.debug "Destroy called"
       log_out if logged_in?
       redirect_to root_url
  end

end
