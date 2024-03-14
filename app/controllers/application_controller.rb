class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include StudentsHelper

  @@dayTimeAndZone = ["","",""]

  # Make it global:
  # Pending Students:
  # 11a to 12p
  $cellsInYellow11 = false
  $cellsInYellow12 = false
  $cellsInYellow13 = false
  $cellsInYellow14 = false
  # 12p to 1p
  $cellsInYellow21 = false
  $cellsInYellow22 = false
  $cellsInYellow23 = false
  $cellsInYellow24 = false
  # 1p to 2p
  $cellsInYellow31 = false
  $cellsInYellow32 = false
  $cellsInYellow33 = false
  $cellsInYellow34 = false
  # 2p to 3p
  $cellsInYellow41 = false
  $cellsInYellow42 = false
  $cellsInYellow43 = false
  $cellsInYellow44 = false
  # 3p to 4p
  $cellsInYellow51 = false
  $cellsInYellow52 = false
  $cellsInYellow53 = false
  $cellsInYellow54 = false

  # Confirmed Students:
  # 11a to 12p
  $cellsInRed11 = false
  $cellsInRed12 = false
  $cellsInRed13 = false
  $cellsInRed14 = false
  # 12p to 1p
  $cellsInRed21 = false
  $cellsInRed22 = false
  $cellsInRed23 = false
  $cellsInRed24 = false
  # 1p to 2p
  $cellsInRed31 = false
  $cellsInRed32 = false
  $cellsInRed33 = false
  $cellsInRed34 = false
  # 2p to 3p
  $cellsInRed41 = false
  $cellsInRed42 = false
  $cellsInRed43 = false
  $cellsInRed44 = false
  # 3p to 4p
  $cellsInRed51 = false
  $cellsInRed52 = false
  $cellsInRed53 = false
  $cellsInRed54 = false


  
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
    logger.debug ">>>>>>>>>>>>>>  GOT HERE!!!!!!!!!!!!!"

    @@tzone = v # ["t1", "t2"]
  end
  def getTimeZone()
    return @@tzone
  end




end
