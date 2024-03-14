class StudentsController < ApplicationController
  def new
     logger.debug "GOT HERE AT STUDENTS NEW URL"
     logger.debug "Current user:  #{current_user}"
     logger.debug "Current student:  #{current_student}"
     # logger.debug "Current student email:  #{current_student.email}"

     begin
       if current_student.email
          render 'show'
       else
          @student       = Student.new
          @student.email = current_user.email
          @day           = current_user.lessonday
       end
     rescue NoMethodError => e
          logger.debug ">>>>  NO EMAIL YET, CREATING STUDENT <<<<<"
          @student       = Student.new
          @student.email = current_user.email
          @day           = current_user.lessonday
     rescue => e
         logger.debug ">>>>  ERROR UNKNOWN: #{e.class}"
         redirect_to(root_url)
     end
  end

  def show
     logger.debug "GOT HERE AT STUDENTS SHOW URL"
  end

  def show
     logger.debug "GOT HERE AT STUDENTS UPDATE URL"
  end


  def create
     @student       = Student.new(student_params)
     @student.email = current_user.email

     if @student.save
        flash.now[:success] = "Thank you, you will receive an email to a link for your first lesson!!"
        render 'show'
     else
        flash.now[:danger] = "Student profile error!! OOPS"
        render 'new'
     end
 
  end

  def edit
  end

  def destroy
     logger.debug " Student destroy in controller called"
  end


private
  def student_params
    params.require(:student).permit(:active, :favoritegenre, :interests, :currentlevel, :currentlesson, :startingdate)
  end
  def changeDateFormat(oldDate)
    @strArray = oldDate.split("-")
    if @strArray.length() == 3
       return @strArray[2] + "-" + array[0] + "-" + array[1]
    else 
       return oldDate
    end

  end
end
