class Level1Lesson1Controller < ApplicationController
  def new
     logger.debug ">>>>>>  NEW LESSON!!!"
  end
  def show
     logger.debug ">>>>>>>>> SHOW"
  end

  def edit

     # Move this to just under <%= form for ....
     # <%= render 'shared/error_messages' %>
     @number_correct = 0.0;
     @total = 18.0;
     @l1l1Answers = ''; # = {:soundboard=>'',:bridge=>''};
     logger.debug ">>>>>>>>> EDIT"
     logger.debug "       sound board:  #{params[:soundboard]}"
     @l1l1Answers.soundboard = params[:soundboard]
     if params[:soundboard] == 'sound board'  # 1
       @number_correct += 1;
     # else
     end
     if params[:bridge] == 'bridge'           #2
       @number_correct += 1;
     # else
     end
     if params[:saddle] == 'saddle'           #3
       @number_correct += 1;
     # else
     end
     if params[:tuning_pegs] == 'tuning pegs' #4
       @number_correct += 1;
     # else
     end
     if params[:frets] == 'frets'             #5
       @number_correct += 1;
     # else
     end
     if params[:fret_board] == 'fret board'   #6
       @number_correct += 1;
     # else
     end
     if params[:nut] == 'nut'                 #7
       @number_correct += 1;
     # else
     end
     if params[:pick_guard] == 'pick_guard'   #8
       @number_correct += 1;
     # else
     end
     if params[:finger_1] == '1'              #9
       @number_correct += 1;
     # else
     end
     if params[:finger_2] == '2'              #10
       @number_correct += 1;
     # else
     end
     if params[:finger_3] == '3'              #11
       @number_correct += 1;
     # else
     end
     if params[:finger_4] == '4'              #12
       @number_correct += 1;
     # else
     end
     if params[:finger_t].to_s.downcase == 't'     #13
       @number_correct += 1;
     # else
     end
     if params[:finger_m].to_s.downcase == 'm'     #14
       @number_correct += 1;
     # else
     end
     if params[:finger_a].to_s.downcase  == 'a'    #15
       @number_correct += 1;
     # else
     end
     if params[:finger_i].to_s.downcase == 'i'     #16
       @number_correct += 1;
     # else
     end
     if params[:finger_c].to_s.downcase == 'c'     #17
       @number_correct += 1;
     # else
     end
     if params[:finger_p].to_s.downcase == 'p'     #18
       @number_correct += 1;
     # else
     end
 
     percentage = 100.0 * @number_correct / @total;
     logger.debug ">>>>>>>>> PERCENT PASSING:  #{@percentage}"
     if percentage == 100.0
        flash[:success] = "WOW!  Very good you got a 100%"
     else
        #p = "%.1" % @percentage.to_d
        flash[:success] = "You scored #{percentage}%"
        render 'edit'
     end
 




  end

  def delete
  end
end
