class L1L1QuestionsController < ApplicationController
  $is_error = "is_no_error"
  def new
     logger.debug ">>>>>>>>> NEW"

     @l1_l1_errors = {:sound_board => 'is_not_graded', :bridge   => 'is_not_graded', :sound_hole => 'is_not_graded',
                      :tuning_pegs => 'is_not_graded', :frets    => 'is_not_graded', :fret_board => 'is_not_graded',
                      :nut         => 'is_not_graded', :saddle   => 'is_not_graded', :pick_guard => 'is_not_graded',
                      :finger_3    => 'is_not_graded_finger', :finger_2 => 'is_not_graded_finger', :finger_m   => 'is_not_graded_finger',
                      :finger_a    => 'is_not_graded_finger', :finger_4 => 'is_not_graded_finger', :finger_1   => 'is_not_graded_finger',
                      :finger_i    => 'is_not_graded_finger', :finger_c => 'is_not_graded_finger', :finger_t   => 'is_not_graded_finger',
                      :finger_p    => 'is_not_graded_finger'
                     }
     @l1_l1_question = L1L1Question.new
     redirect_to "/l1_l1_questions/edit"
  end
  def show
     logger.debug ">>>>>>>>> SHOw"
  end

  def edit
     @l1_l1_question = L1L1Question.new
     @l1_l1_errors = {:sound_board => 'is_not_graded', :bridge   => 'is_not_graded', :sound_hole => 'is_not_graded',
                      :tuning_pegs => 'is_not_graded', :frets    => 'is_not_graded', :fret_board => 'is_not_graded',
                      :nut         => 'is_not_graded', :saddle   => 'is_not_graded', :pick_guard => 'is_not_graded',
                      :finger_3    => 'is_not_graded_finger', :finger_2 => 'is_not_graded_finger', :finger_m   => 'is_not_graded_finger',
                      :finger_a    => 'is_not_graded_finger', :finger_4 => 'is_not_graded_finger', :finger_1   => 'is_not_graded_finger',
                      :finger_i    => 'is_not_graded_finger', :finger_c => 'is_not_graded_finger', :finger_t   => 'is_not_graded_finger',
                      :finger_p    => 'is_not_graded_finger'
                     }
 
  end
  def create
     number_correct = 0.0
     total = 19.0
     logger.debug "student email:  #{current_student.email}"

     @l1_l1_errors = {:sound_board => 'is_correct', :bridge   => 'is_correct', :sound_hole => 'is_correct',
                      :tuning_pegs => 'is_correct', :frets    => 'is_correct', :fret_board => 'is_correct',
                      :nut         => 'is_correct', :saddle   => 'is_correct', :pick_guard => 'is_correct',
                      :finger_3    => 'is_correct_finger', :finger_2 => 'is_correct_finger', :finger_m   => 'is_correct_finger',
                      :finger_a    => 'is_correct_finger', :finger_4 => 'is_correct_finger', :finger_1   => 'is_correct_finger',
                      :finger_i    => 'is_correct_finger', :finger_c => 'is_correct_finger', :finger_t   => 'is_correct_finger',
                      :finger_p    => 'is_correct_finger'
                     }
 
 
     @l1_l1_question = L1L1Question.new(l1_l1_question_params)
     @l1_l1_questions_with_wrong_answers = L1L1Question.new(l1_l1_question_params)


     @l1_l1_question.email = current_student.email
     @l1_l1_questions_with_wrong_answers.email = current_student.email

     p = 100.0
     if @l1_l1_question.save
        logger.debug "Questions saved";
     else   
        logger.debug "Level One Lesson One Error count:  #{@l1_l1_question.errors.count}";
        p = 100.0 * (total - @l1_l1_question.errors.count.to_d) / total;
        @l1_l1_question.errors.full_messages.each do |err|
           logger.debug "Error:  #{err}";
        end
        @l1_l1_question.errors.attribute_names.each do |attr|
           @l1_l1_question.email = current_student.email
           logger.debug "Errors attribute name:  #{attr}";
           if "finger".in? attr.to_s
              @l1_l1_errors[attr] = 'is_wrong_finger'
              s = attr.to_s[7..-1]
              @l1_l1_questions_with_wrong_answers[attr] = s + "_WRONG_ANSWER"
           else
              @l1_l1_errors[attr] = 'is_wrong'
              @l1_l1_questions_with_wrong_answers[attr] = attr.to_s + "_WRONG_ANSWER"
           end
           
           logger.debug "            new value for attribute:  #{@l1_l1_question[attr]}"
           logger.debug "            current value for attribute:  #{@l1_l1_errors[attr]}"
        end
        if @l1_l1_questions_with_wrong_answers.save
           logger.debug "Questions With Wrong Answers saved saved";
        else   
           logger.debug ">>> NEW Level One Lesson One Error count:  #{@l1_l1_question.errors.count}";
        end
        @l1_l1_question.save
        flash[:success] = "You scored #{'%.1f' % p}%"
        render 'edit'
     end
     if p == 100.0
        flash[:success] = "WOW!  Very good you got a 100%"
     end
 

  end
private
  def l1_l1_question_params
    params.require(:l1_l1_question).permit(:email, :sound_board, :sound_hole, :pick_guard,
                                           :bridge, :saddle, :tuning_pegs, 
                                           :frets, :fret_board, :nut,
                                           :finger_1, :finger_2, :finger_3, :finger_4, :finger_t,
                                           :finger_m, :finger_a, :finger_i,
                                           :finger_c, :finger_p)
  end

end
