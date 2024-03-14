module StudentsHelper
   @student
   def current_student
      logger.debug ">>>>>>>>  email: #{current_user.email}"
      @current_student = Student.find_by(email: current_user.email)
   end
   def current_student?(email)
     begin
       @student = Student.find_by(email: email)
       if @student
          logger.debug "Found student:  #{@student}"
          return true
       else
          return false
       end
     rescue => e
         return false
     end
     false
   end
end
