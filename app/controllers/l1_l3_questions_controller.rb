class L1L3QuestionsController < ApplicationController
  def new
    logger.debug(">>>>>>>>>>>>>>>L1L3 New called");
  end

  def show
    logger.debug(">>>>>>>>>>>>>>>L1L3 Show called");
    @l1_l3_errors = {:majorkeys => 'isnotgraded', :minorkeys => 'isnotgraded', :major_chord_i => 'isnotgraded',
                     :major_chord_iv => 'isnotgraded', :major_chord_v => 'isnotgraded', :transpose => 'isnotgraded',
                     :key_of_c => 'isnotgraded', :key_of_g => 'isnotgraded', :key_of_d => 'isnotgraded'}
  end

  def edit
    logger.debug(">>>>>>>>>>>>>>>L1L3 Edit called");
    @l1_l3_question = L1L3Question.new
 
    @l1_l3_errors = {:majorkeys => 'isnotgraded', :minorkeys => 'isnotgraded', :major_chord_i => 'isnotgraded',
                     :major_chord_iv => 'isnotgraded', :major_chord_v => 'isnotgraded', :transpose => 'isnotgraded',
                     :key_of_c => 'isnotgraded', :key_of_g => 'isnotgraded', :key_of_d => 'isnotgraded'}
 
  end

  def create
     logger.debug ">>>   L1L3 CREATE"
     correctAnswers = {:key_of_c => 'C',:key_of_g => 'G',:key_of_d => 'D',
                       :majorkeys => 12,:minorkeys =>12,
                       :major_chord_i => 'G',:major_chord_iv => 'C',:major_chord_v => 'D',
                       :transpose => 'Transpose'}
     number_correct = 0.0
     total = 9.0
     @l1_l3_errors = {:majorkeys => 'iscorrect', :minorkeys => 'iscorrect', :major_chord_i => 'iscorrect',
                      :major_chord_iv => 'iscorrect', :major_chord_v => 'iscorrect', :transpose => 'iscorrect',
                      :key_of_c => 'iscorrect', :key_of_g => 'iscorrect', :key_of_d => 'iscorrect'}

     @l1_l3_question = L1L3Question.new(l1_l3_question_params)
     @l1_l3_questions_with_wrong_answers = L1L3Question.new(l1_l3_question_params)


     @l1_l3_question.email = current_student.email
     @l1_l3_questions_with_wrong_answers.email = current_student.email

     p = 100.0
     if @l1_l3_question.save
        logger.debug "Questions saved";
     else
        logger.debug "Level One Lesson Three Error count:  #{@l1_l3_question.errors.count}";
        p = 100.0 * (total - @l1_l3_question.errors.count.to_d) / total;
        @l1_l3_question.errors.full_messages.each do |err|
           logger.debug "Error:  #{err}";
        end
        @l1_l3_question.errors.attribute_names.each do |attr|
           @l1_l3_question.email = current_student.email
           logger.debug "Errors attribute name:  #{attr}";
           @l1_l3_errors[attr] = 'iswrong'
           @l1_l3_questions_with_wrong_answers[attr] = correctAnswers[attr] + "__WRONG_ANSWER" # _OF_" + @l1_l3_question[attr] // later
          
           logger.debug "            new value for attribute:      #{@l1_l3_question[attr]}"
           logger.debug "            current value for attribute:  #{@l1_l3_errors[attr]}"
           logger.debug "            new value to save:            #{@l1_l3_questions_with_wrong_answers[attr]}"
 
        end
        if @l1_l3_questions_with_wrong_answers.save
           logger.debug "Questions With Wrong Answers saved";
        else   
           logger.debug ">>> NEW Level Three Lesson One Error count:  #{@l1_l3_question.errors.count}";
        end
        @l1_l3_question.save
        flash[:success] = "You scored #{'%.1f' % p}%"
     end
     if p == 100.0
        flash[:success] = "You scored a 100%, FANTASTIC!"
     end
     render 'edit'
  end

private
  def l1_l3_question_params
    params.require(:l1_l3_question).permit(:email, :majorkeys, :minorkeys, 
                                           :major_chord_i,:major_chord_iv,:major_chord_v,:transpose,
                                           :key_of_c,:key_of_g,:key_of_d)
  end


end
