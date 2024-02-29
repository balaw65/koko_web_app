class SchedulerController < ApplicationController
  protect_from_forgery with: :null_session
  def show
    logger.debug "-----> Scheduler show called"
  end
  def new
    logger.debug "Scheduler new called"
  end
  def calendar
    case getTimeZone()
      when "pacific"
        @timesByZone = ["11a to 12p","12p to 1p","1p to 2p","2p to 3p","3p to 4p"]
      when "mountain"
        @timesByZone = ["12p to 1p","1p to 2p","2p to 3p","3p to 4p","4p to 5p"]
      when "central"
        @timesByZone = ["1p to 2p","2p to 3p","3p to 4p","4p to 5p","5p to 6p"]
      when "atlantic"
        @timesByZone = ["2p to 3p","3p to 4p","4p to 5p","5p to 6p","6p to 7p"]
      else
        @timesByZone = ["........","........","........","........","........"]
    end
  end
  def timezone

    if request.get?
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
    @dayOfTheWeek = params[:day]

    # @daytimeslots = [params[:time], params[:day], params[:zone]]
    # Adjust for time zone:
    hour1 = params[:time].match(/^[0-9]+/)
    hour2 = params[:time].match(/[0-9]+.m$/) #.match(/^[0-9]+/)
    hour2 = hour2.to_s.match(/^[0-9]+/)

    hour1AmOrPm = params[:time].match(/^[0-9]+.m/)
    hour2AmOrPm = params[:time].match(/^[0-9]+.m/)
 
    # switch to 24 hour clock:
    if "pm".in? hour1AmOrPm.to_s
      logger.debug "Hour one is pm"
      if hour1.to_s.to_i == 12
        h1 = 12
      else
        h1 = hour1.to_s.to_i + 12
      end
    else
      h1 = hour1.to_s.to_i
    end
    if "pm".in? hour2AmOrPm.to_s
      logger.debug "Hour two is pm"
      if hour2.to_s.to_i == 12
        h2 = 12
      else
        h2 = hour2.to_s.to_i + 12
      end
    else
      h2 = hour2.to_s.to_i
    end
 

    case getTimeZone()
      when "pacific"
        h1 = h1 - 1
        h2 = h2 - 1
      when "mountain"
      when "central"
        h1 = h1 + 1
        h2 = h2 + 1
      when "atlantic"
        h1 = h1 + 2
        h2 = h2 + 2
      else
        logger.debug "Unknown time zone"
    end

     # convert back to 12 hour clock:
    if h1 >= 12
      if h1 != 12
        h1 = h1 - 12
      else
        h1 = 12
      end
      @nt1 = h1.to_s + "pm to "
    else
      @nt1 = h1.to_s + "am to "
    end
    if h2 >= 12
      if h2 != 12
        h2 = h2 - 12
      else
        h2 = 12
      end
      @nt2 = h2.to_s + "pm"
    else
      @nt2 = h2.to_s + "am"
    end
    @newtime = @nt1 + @nt2


    # @newtime = (h1 - 1).to_s + "pm to " + (h2 - 1).to_s + "pm"
    @daytimeslots = [@newtime, params[:day], getTimeZone()]
    setScheduleTime(@daytimeslots)
    params[:zone] = getTimeZone()

  end

end

