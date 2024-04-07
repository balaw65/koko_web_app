class L1L3Question < ApplicationRecord


   #MAJOR_KEYS_REGEX  = /\12[__WRONG_ANSWER]*\z/
   #MINOR_KEYS_REGEX  = /\12[__WRONG_ANSWER]*\z/
 
   MAJOR_CHORD_i     = /\AG[__WRONG_ANSWER]*\z/
   MAJOR_CHORD_iv    = /\AC[__WRONG_ANSWER]*\z/
   MAJOR_CHORD_v     = /\AD[__WRONG_ANSWER]*\z/
   KEY_OF_C          = /\AC[__WRONG_ANSWER]*\z/
   KEY_OF_G          = /\AG[__WRONG_ANSWER]*\z/
   KEY_OF_D          = /\AD[__WRONG_ANSWER]*\z/
   TRANSPOSE         = /\Transpose[__WRONG_ANSWER]*\z/

   #validates_format_of :majorkeys,     with: MAJOR_KEYS_REGEX, message: "Incorrect answer, answer is 12"
   #validates_format_of :minorkeys,     with: MINOR_KEYS_REGEX, message: "Incorrect answer, answer is 12"
   validates_format_of :major_chord_i, with: MAJOR_CHORD_i, message: "Incorrect answer, answer is 'G'"
   validates_format_of :major_chord_iv,with: MAJOR_CHORD_iv, message: "Incorrect answer, answer is 'D'"
   validates_format_of :major_chord_v, with: MAJOR_CHORD_v, message: "Incorrect answer, answer is 'C'"
   validates_format_of :key_of_c,      with: KEY_OF_C, message: "Incorrect answer, answer is 'C'"
   validates_format_of :key_of_g,      with: KEY_OF_G, message: "Incorrect answer, answer is 'G'"
   validates_format_of :key_of_d,      with: KEY_OF_D, message: "Incorrect answer, answer is 'D'"
   validates_format_of :transpose,     with: TRANSPOSE, message: "Bit of a trick question since it wasn't covered, the correct answer is Transpose"

end
