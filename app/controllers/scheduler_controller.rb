class SchedulerController < ApplicationController
  protect_from_forgery with: :null_session

  # Bummer this doesnt' work for this version:  enum :timezones, {pacific: -7, mountain: -6, central: -5, atlantic: -4}

  # Ruby's class variables replaced with enum, still seeing if there might be a Gems
  Pacific_offset  = -8
  Mountain_offset = -7
  Central_offset  = -6
  Atlantic_offset = -5


  def show
    setCellsInYellow_12
 
    logger.debug "-----> Scheduler show called"
  end
  def new
    setCellsInYellow_12
    logger.debug "Scheduler new called"
  end
  def calendar

    case getTimeZone()
      when "pacific"
        @timesByZone = ["11am to 12pm","12pm to 1pm","1pm to 2pm","2pm to 3pm","3pm to 4pm"]
      when "mountain"
        @timesByZone = ["12pm to 1pm","1pm to 2pm","2pm to 3pm","3pm to 4pm","4pm to 5pm"]
      when "central"
        @timesByZone = ["1pm to 2pm","2pm to 3pm","3pm to 4pm","4pm to 5pm","5pm to 6pm"]
      when "atlantic"
        @timesByZone = ["2pm to 3pm","3pm to 4pm","4pm to 5pm","5pm to 6pm","6pm to 7pm"]
      else
        @timesByZone = ["........","........","........","........","........"]
    end

  end
  def timezone

    if request.get?
      # This will blocks out all pending students, yellow
      # and all confirmed students, red:
      allusers = User.all
      allusers.each do |user|
        if user.usertype == 'guest'
           utc = user.lessontime.to_i
           fillYellowBox(utc, user.lessonday)
        end # end of usertype 'guests'
        if user.usertype == 'student'
           logger.debug "#{user.name} is a student with lesson time #{user.lessontime} and day #{user.lessonday}"
           utc = user.lessontime.to_i
           fillRedBox(utc, user.lessonday)
        end # end of usertype 'student'
      end # end of allusers
 
      @scheduler = Scheduler.new
      return
    end
    setTimeZone(params[:scheduler][:timezone])

    redirect_to "/scheduler/calendar"

    # logger.debug "---->HTTP NOT GET Should have redirected?????"
 
    # logger.debug "--->Time Zone: #{params[:zone]}"
    
    # if post:
    # if request.post?
    #   logger.debug "---->HTTP POST"
    # end
    # if time zone 'pacific':
    # @timesByZone = ["1p to 2p","2p to 3p"];
  end
  def day
     logger.debug "---> DAY POST" 
     params[:zone] = getTimeZone()

     logger.debug " zone:  #{params[:zone]}"
     logger.debug "  day:  #{params[:day]}"
     logger.debug " time:  #{params[:time]}"
     @daytimeslots = [params[:time], params[:day], params[:zone]]
     setScheduleTime(@daytimeslots)
 
  end




    


#   @dayOfTheWeek = params[:day]

#   # @daytimeslots = [params[:time], params[:day], params[:zone]]
#   # Adjust for time zone:
#   hour1 = params[:time].match(/^[0-9]+/)
#   hour2 = params[:time].match(/[0-9]+.m$/) #.match(/^[0-9]+/)
#   hour2 = hour2.to_s.match(/^[0-9]+/)

#   hour1AmOrPm = params[:time].match(/^[0-9]+.m/)
#   hour2AmOrPm = params[:time].match(/^[0-9]+.m/)
#
#   # switch to 24 hour clock:
#   if "pm".in? hour1AmOrPm.to_s
#     logger.debug "Hour one is pm"
#     if hour1.to_s.to_i == 12
#       h1 = 12
#     else
#       h1 = hour1.to_s.to_i + 12
#     end
#   else
#     h1 = hour1.to_s.to_i
#   end
#   if "pm".in? hour2AmOrPm.to_s
#     logger.debug "Hour two is pm"
#     if hour2.to_s.to_i == 12
#       h2 = 12
#     else
#       h2 = hour2.to_s.to_i + 12
#     end
#   else
#     h2 = hour2.to_s.to_i
#   end
#

#   case getTimeZone()
#     when "pacific"
#       h1 = h1 - 1
#       h2 = h2 - 1
#     when "mountain"
#     when "central"
#       h1 = h1 + 1
#       h2 = h2 + 1
#     when "atlantic"
#       h1 = h1 + 2
#       h2 = h2 + 2
#     else
#       logger.debug "Unknown time zone"
#   end

#    # convert back to 12 hour clock:
#   if h1 >= 12
#     if h1 != 12
#       h1 = h1 - 12
#     else
#       h1 = 12
#     end
#     @nt1 = h1.to_s + "pm to "
#   else
#     @nt1 = h1.to_s + "am to "
#   end
#   if h2 >= 12
#     if h2 != 12
#       h2 = h2 - 12
#     else
#       h2 = 12
#     end
#     @nt2 = h2.to_s + "pm"
#   else
#     @nt2 = h2.to_s + "am"
#   end
#   @newtime = @nt1 + @nt2


#   # @newtime = (h1 - 1).to_s + "pm to " + (h2 - 1).to_s + "pm"
#   @daytimeslots = [@newtime, params[:day], getTimeZone()]
#   setScheduleTime(@daytimeslots)
#   params[:zone] = getTimeZone()
#  end
private
  # 12p --> 19 utc time
  #  1p --> 20 utc time
  #  2p --> 21 utc time
  #  3p --> 22 utc time
  #  4p --> 23 utc time
  #  5p --> 24 utc time
  def fillYellowBox(utcTime, day)
    case day
      when 'Monday'
        case utcTime
           when 19
             $cellsInYellow11 = true
           when 20
             $cellsInYellow21 = true
           when 21
             $cellsInYellow31 = true
           when 22
             $cellsInYellow41 = true
           when 23
             $cellsInYellow51 = true
        end
      when 'Tuesday'
        case utcTime
           when 19
             $cellsInYellow12 = true
           when 20
             $cellsInYellow22 = true
           when 21
             $cellsInYellow32 = true
           when 22
             $cellsInYellow42 = true
           when 23
             $cellsInYellow52 = true
        end
      when 'Wednesday'
        case utcTime
           when 19
             $cellsInYellow13 = true
           when 20
             $cellsInYellow23 = true
           when 21
             $cellsInYellow33 = true
           when 22
             $cellsInYellow43 = true
           when 23
             $cellsInYellow53 = true
        end
 
      when 'Thursday'
        case utcTime
           when 19
             $cellsInYellow14 = true
           when 20
             $cellsInYellow24 = true
           when 21
             $cellsInYellow34 = true
           when 22
             $cellsInYellow44 = true
           when 23
             $cellsInYellow54 = true
        end
    end
  end
  def fillRedBox(utcTime, day)
    case day
      when 'Monday'
        case utcTime
           when 19
             $cellsInRed11 = true
             $cellsInYellow11 = false
           when 20
             $cellsInRed21 = true
             $cellsInYellow21 = false
           when 21
             $cellsInRed31 = true
             $cellsInYellow31 = false
           when 22
             $cellsInRed41 = true
             $cellsInYellow41 = false
           when 23
             $cellsInRed51 = true
             $cellsInYellow51 = false
        end
      when 'Tuesday'
        case utcTime
           when 19
             $cellsInRed12 = true
             $cellsInYellow12 = false
           when 20
             $cellsInRed22 = true
             $cellsInYellow22 = false
           when 21
             $cellsInRed32 = true
             $cellsInYellow32 = false
           when 22
             $cellsInRed42 = true
             $cellsInYellow42 = false
           when 23
             $cellsInRed52 = true
             $cellsInYellow52 = false
        end
      when 'Wednesday'
        case utcTime
           when 19
             $cellsInRed13 = true
             $cellsInYellow13 = false
           when 20
             $cellsInRed23 = true
             $cellsInYellow23 = false
           when 21
             $cellsInRed33 = true
             $cellsInYellow33 = false
           when 22
             $cellsInRed43 = true
             $cellsInYellow43 = false
           when 23
             $cellsInRed53 = true
             $cellsInYellow53 = false
        end
 
      when 'Thursday'
        case utcTime
           when 19
             $cellsInRed14 = true
           when 20
             $cellsInRed24 = true
           when 21
             $cellsInRed34 = true
           when 22
             $cellsInRed44 = true
           when 23
             $cellsInRed54 = true
        end
    end
  end


end

