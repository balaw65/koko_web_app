class L1L2QuestionsController < ApplicationController
  def new
    logger.debug ">>>>>>>  L1L2 NEW HERE"
  end

  def show
     @l1_l2_errors = {:el_string => 'isnotgraded', :a_string => 'isnotgraded', :d_string => 'isnotgraded',
                      :g_string  => 'isnotgraded', :b_string => 'isnotgraded', :eh_string => 'isnotgraded'
                     }
  end

  def edit
     logger.debug ">>>   L1L2 EDIT"
     @l1_l2_question = L1L2Question.new
     @l1_l2_errors = {:el_string => 'isnotgraded', :a_string => 'isnotgraded', :d_string => 'isnotgraded',
                      :g_string  => 'isnotgraded', :b_string => 'isnotgraded', :eh_string => 'isnotgraded'
                     }

  end

  def create
     logger.debug ">>>   L1L2 CREATE"
     number_correct = 0.0
     total = 6.0


     @l1_l2_errors = {:el_string => 'iscorrect', :astring => 'iscorrect', :d_string => 'iscorrect',
                      :g_string  => 'iscorrect', :bstring => 'iscorrect', :eh_string => 'iscorrect'
                     }
     @l1_l2_question = L1L2Question.new(l1_l2_question_params)
     @l1_l2_questions_with_wrong_answers = L1L2Question.new(l1_l2_question_params)


     @l1_l2_question.email = current_student.email
     @l1_l2_questions_with_wrong_answers.email = current_student.email

     p = 100.0
     if @l1_l2_question.save
        logger.debug "Questions saved";
     else
        logger.debug "Level One Lesson Two Error count:  #{@l1_l2_question.errors.count}";
        p = 100.0 * (total - @l1_l2_question.errors.count.to_d) / total;
        @l1_l2_question.errors.full_messages.each do |err|
           logger.debug "Error:  #{err}";
        end
        @l1_l2_question.errors.attribute_names.each do |attr|
           @l1_l2_question.email = current_student.email
           logger.debug "Errors attribute name:  #{attr}";
           @l1_l2_errors[attr] = 'iswrong'
           @l1_l2_questions_with_wrong_answers[attr] = attr.to_s + "_WRONG_ANSWER"
           
           logger.debug "            new value for attribute:  #{@l1_l2_question[attr]}"
           logger.debug "            current value for attribute:  #{@l1_l2_errors[attr]}"
        end
        if @l1_l2_questions_with_wrong_answers.save
           logger.debug "Questions With Wrong Answers saved saved";
        else   
           logger.debug ">>> NEW Level One Lesson One Error count:  #{@l1_l2_question.errors.count}";
        end
        @l1_l2_question.save
        flash[:success] = "You scored #{'%.1f' % p}%"
        render 'edit'
     end
     if p == 100.0
        flash[:success] = "You scored a 100%, FANTASTIC!"
     end
     render 'edit'

 
  end

private
  def l1_l2_question_params
    params.require(:l1_l2_question).permit(:email, :el_string, :a_string, :d_string,
                                           :g_string, :b_string, :eh_string)
  end





end
