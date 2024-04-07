class L1L2Question < ApplicationRecord


   E_LOW_STRING_REGEX  = /\AE[__WRONG_ANSWER]*\z/
   A_STRING_REGEX      = /\AA[__WRONG_ANSWER]*\z/
   D_STRING_REGEX      = /\AD[__WRONG_ANSWER]*\z/
   G_STRING_REGEX      = /\AG[__WRONG_ANSWER]*\z/
   B_STRING_REGEX      = /\AB[__WRONG_ANSWER]*\z/
   E_HIGH_STRING_REGEX = /\Ae[__WRONG_ANSWER]*\z/

   validates_format_of :el_string, with: E_LOW_STRING_REGEX, message: "Incorrect answer, answer is 'E'"
   validates_format_of :a_string,  with: A_STRING_REGEX, message: "Incorrect answer, answer is 'A'"
   validates_format_of :d_string,  with: D_STRING_REGEX, message: "Incorrect answer, answer is 'D'"
   validates_format_of :g_string,  with: G_STRING_REGEX, message: "Incorrect answer, answer is 'G'"
   validates_format_of :b_string,  with: B_STRING_REGEX, message: "Incorrect answer, answer is 'B'"
   validates_format_of :eh_string, with: E_HIGH_STRING_REGEX, message: "Incorrect answer, answer is 'e'"

end
