class UsersController < ApplicationController
  def show
    logger.debug "-----> show called"


    @user = User.find(params[:id])

    @dayOfTheWeek = "Tuesday"
  end
  def new
    logger.debug "-----> new called"

    @timeslot= getScheduleTime()
    @zaTimeZone = @timeslot.third
    @zaLessonTime = @timeslot.first
    @zaLessonDay = @timeslot.second
 
    @user = User.new
 
  end
  def welcome
    logger.debug "-----> welcome called"
    logger.debug @user
  end
  def create

    logger.debug "A Debug Mssage: #{params[:user]}"
    logger.debug "User params:    #{user_params}"

 
    @user = User.new(user_params)
    if @user.save
      #Handle a successful save
      logger.debug "RECORD SAVED"
      # Not HERE!!!!!!!!!!!!  redirect_to user_url(@user)
      render 'welcome'
    else
      logger.debug "RECORD FAILED"
      @zaTimeZone = params[:user][:timezone]
      @zaLessonTime = params[:user][:lessontime]
      @zaLessonDay = params[:user][:lessonday]
 
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :timezone, :lessontime, :lessonday, :usertype, :password, :password_confirmation)
  end
end
