class UsersController < ApplicationController
#  before_action :logged_in_user, only: [:index, :edit, :update]
#  before_action :logged_in_user, only: [:index, :edit, :update]
 
#  before_action :admin_user,   only: [:edit, :update]

  Pacific_offset  = -8
  Mountain_offset = -7
  Central_offset  = -6
  Atlantic_offset = -5



  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def admin_user
    @user = User.find(params[:id])
    # Do not want this:  As admin, want to be able to edit
    # any users profile:
    # redirect_to(root_url) unless current_user?(@user)
  end

  def show
    # logger.debug "-----> show called"

    @user = User.find(params[:id])
    # debugger
    logger.debug "-----> Call for user at id:  #{params[:id]}"



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

    logger.debug "Creating user: "
    logger.debug "               name:  #{user_params[:name]}"
    logger.debug "         lesson day:  #{user_params[:lessonday]}"
    logger.debug "     user time zone:  #{user_params[:timezone]}"
 
    # user_params[:lessontime] = get_utc(user_params[:timezone], user_params[:lessontime])
    utc = get_utc(user_params[:timezone].to_s, user_params[:lessontime].to_s)
    params[:user][:lessontime] = utc
 
    logger.debug "  -->lesson time (utc):  #{user_params[:lessontime]}"

 
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      #Handle a successful save
      log_in @user
      logger.debug "RECORD SAVED"
      flash.now[:success] = "Hope you are ready to have some fun!!!"
      UserMailer.account_activation(@user).deliver_now
 
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
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])

    logger.debug "------------------------------------"
    logger.debug "Update user with:  #{user_params}"
    logger.debug "------------------------------------"


    if @user.update(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end


  end
  def index
    @users = User.all
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "user deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :timezone, :lessontime, :lessonday, :usertype, :password, :password_confirmation)
  end

  private

  def get_24hour(localtime)
    hour1 = localtime.match(/^[0-9]+/)
    hour1AmOrPm = localtime.match(/^[0-9]+.m/)
    h1 = 0
    if "pm".in? hour1AmOrPm.to_s
      if hour1.to_s.to_i == 12
        h1 = 12
      else
        h1 = hour1.to_s.to_i + 12
      end
    else
      h1 = hour1.to_s.to_i
    end
    return h1
  end 
  def get_utc(timezone, localtime)
    logger.debug "======> User timezone  is:  #{timezone}"
    logger.debug "======> User localtime is:  #{localtime}"


    localHour = get_24hour(localtime)
    logger.debug "======> User localhour is   #{localHour}"
    utcHour = 0
    case timezone
       when 'pacific'
         utcHour = localHour - Pacific_offset
       when 'mountain'
         utcHour = localHour - Mountain_offset
       when 'central'
         utcHour = localHour - Central_offset
       when 'atlantic'
         logger.debug "======> ATLANTIC TIME"
 
         utcHour = localHour - Atlantic_offset
    end 
    logger.debug "======> Returning utc hour:  ${utcHour}"
 
    return utcHour
  end

end
