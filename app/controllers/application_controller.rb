class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    # render text: "hello Koko fans!"
    render plain: "hello Koko fans!"
  end

  def setScheduleTime(v)
    @@dayTimeAndZone = v # ["t1", "t2"]
  end
  def getScheduleTime()
    return @@dayTimeAndZone
  end
  def setTimeZone(v)
    @@tzone = v # ["t1", "t2"]
  end
  def getTimeZone()
    return @@tzone
  end




end
