class UsersController < ApplicationController
  before_action :logged_in_user_index, only: [:index] #, :edit, :update]
  before_action :logged_in_user_edit, only: [:edit]

  Pacific_offset  = -8
  Mountain_offset = -7
  Central_offset  = -6
  Atlantic_offset = -5

  def show
    @user = User.find(params[:id])
    if logged_in?
      if current_user.admin? #@user[:admin]
         redirect_to users_url
      else
         redirect_to(students_new_url)
      end
    else
       redirect_to(root_url)
    end
  end

  def new
    @timeslot= getScheduleTime()
    @zaTimeZone = @timeslot.third
    @zaLessonTime = @timeslot.first
    @zaLessonDay = @timeslot.second
 
    @user = User.new
  end

  def welcome
  end

  def create


    # user_params[:lessontime] = get_utc(user_params[:timezone], user_params[:lessontime])
    utc = get_utc(user_params[:timezone].to_s, user_params[:lessontime].to_s)
    params[:user][:lessontime] = utc
 
 
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
      logger.debug "Error count:  #{@user.errors.count}";
      if @user.errors.count > 0
         @user.errors.full_messages.each do |m|
           logger.debug m
         end
      end
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

    s = Student.find_by(email:@user.email)
    if @user.update(user_params)
      if s
         if s.update(active:true)
            flash[:success] = "Profile Updated"
            redirect_to @user
         else
            flash[:danger] = "Problem updating student"
            render 'edit'
         end
      else
         flash[:success] = "Profile Updated"
         redirect_to @user
      end
    else
      flash[:danger] = "Problem updating student"
      render 'edit'
    end
  end

  def index
    @users = User.all
  end
  def destroy
    # TODO delete user/student from all of the other tables:

    # find student in Student table and delete:
    u = User.find(params[:id])
    Student.find_by(email: u.email).destroy

    # find user in User table and delete:
    User.find(params[:id]).destroy
    flash[:success] = "user deleted"
    redirect_to users_url
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :timezone, :lessontime, :lessonday, :usertype, :password, :password_confirmation)
  end


  def redirect_to_root
     redirect_to root_path
  end

  def logged_in_user_index
     if logged_in?
       if current_user.admin?
          logger.debug "    ..........  USER IS AN ADMIN"
          flash[:success] = "User is an admin"
 
       else
          logger.debug "    ..........  USER IS NOT AN ADMIN"
          redirect_to root_path
       end 
     else
       redirect_to root_path
     end
  end

  def logged_in_user_edit
     @user = User.find(params[:id])
     if logged_in?
       if current_user.admin?
          logger.debug "    ..........  USER IS AN ADMIN"
       elsif is_student?
          logger.debug "    ..........  USER IS STUDENT"
          redirect_to(root_url) unless current_user?(@user)
       elsif is_guest?  # I think I want guest to edit their own profile???
          logger.debug "    ..........  USER IS A GUEST"
          redirect_to(root_url) unless current_user?(@user)
       else
          logger.debug "    ..........  USER IS PERHAPS A GUEST"
          redirect_to root_path
       end 
     else
        redirect_to root_path
     end
  end 

  def is_student?
    if current_user.usertype == "student"
       return true
    else
       return false
    end
    false
  end

  def is_guest?
    if current_user.usertype == "guest"
       return true
    else
       return false
    end
    false
  end
 
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
    localHour = get_24hour(localtime)
    utcHour = 0
    case timezone
       when 'pacific'
         utcHour = localHour - Pacific_offset
       when 'mountain'
         utcHour = localHour - Mountain_offset
       when 'central'
         utcHour = localHour - Central_offset
       when 'atlantic'
         utcHour = localHour - Atlantic_offset
    end 
    return utcHour
  end

end
