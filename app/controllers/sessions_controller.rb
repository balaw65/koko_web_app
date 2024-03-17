class SessionsController < ApplicationController

  def new
    logger.debug "<><><><><><><><><><>Session:  #{params[:session]}!!!!!!!!!!!!!!!!1"
  end

  def create

    #######   DEBUGGING TESTING #########
#   logger.debug "===> params:  #{params}"
#   u = User.find_by(email: params[:session][:email])
#   if u
#       logger.debug "      user found"
#       if  u.authenticate(params[:session][:password])
#           logger.debug "      user authenticated"
#       else
#           logger.debug "      user NOT authenticated"          
#       end
#   else
#       logger.debug "      user NOT found"
#   end
    ###################################################

    user = User.find_by(email: params[:session][:email].downcase)
    logger.debug "  user password: #{params[:session][:password]}"
    if user && user.authenticate(params[:session][:password])
       logger.debug "User is authenticated"
       log_in user
       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
       remember user
       logger.debug ">>>>>>>>>>>>>>>> REDIRECTING TO USER"
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
