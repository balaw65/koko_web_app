class L1L1Question < ApplicationRecord

   SOUND_BOARD_REGEX = /\Asound.board[_WRONG_ANSWER]*\z/i
   BRIDGE_REGEX      = /\Abridge[_WRONG_ANSWER]*\z/i
   SADDLE_REGEX      = /\Asaddle[_WRONG_ANSWER]*\z/i
   TUNING_PEGS_REGEX = /\Atuning.pegs[_WRONG_ANSWER]*\z/i
   SOUND_HOLE_REGEX  = /\Asound.hole[_WRONG_ANSWER]*\z/i
   FRETS_REGEX       = /\Afrets[_WRONG_ANSWER]*\z/i
   FRET_BOARD_REGEX  = /\Afret.board[_WRONG_ANSWER]*\z/i
   NUT_REGEX         = /\Anut[_WRONG_ANSWER]*\z/i
   PICK_GUARD_REGEX  = /\Apick.guard[_WRONG_ANSWER]*\z/i
   FINGER_2_REGEX    = /\A2[__WRONG_ANSWER]*\z/
   FINGER_3_REGEX    = /\A3[__WRONG_ANSWER]*\z/
   FINGER_4_REGEX    = /\A4[__WRONG_ANSWER]*\z/
   FINGER_1_REGEX    = /\A1[__WRONG_ANSWER]*\z/
   FINGER_t_REGEX    = /\At[__WRONG_ANSWER]*\z/
   FINGER_m_REGEX    = /\Am[__WRONG_ANSWER]*\z/
   FINGER_a_REGEX    = /\Aa[__WRONG_ANSWER]*\z/
   FINGER_i_REGEX    = /\Ai[__WRONG_ANSWER]*\z/
   FINGER_c_REGEX    = /\Ac[__WRONG_ANSWER]*\z/
   FINGER_p_REGEX    = /\Ap[__WRONG_ANSWER]*\z/

   validates_format_of :sound_board, with: SOUND_BOARD_REGEX, message: "Incorrect answer, answer is 'Sound Board'"
   validates_format_of :bridge,      with: BRIDGE_REGEX,      message: "Incorrect answer, answer is 'Bridge'"
   validates_format_of :saddle,      with: SADDLE_REGEX,      message: "Incorrect answer, answer is 'Saddle'"
   validates_format_of :tuning_pegs, with: TUNING_PEGS_REGEX, message: "Incorrect answer, answer is 'Tuning Pegs'"
   validates_format_of :sound_hole,  with: SOUND_HOLE_REGEX,  message: "Incorrect answer, answer is 'Sound Hole'"
   validates_format_of :frets,       with: FRETS_REGEX,       message: "Incorrect answer, answer is 'Frets'"
   validates_format_of :fret_board,  with: FRET_BOARD_REGEX,  message: "Incorrect answer, answer is 'Fret Board'"
   validates_format_of :nut,         with: NUT_REGEX,         message: "Incorrect answer, answer is 'Nut'"
   validates_format_of :pick_guard,  with: PICK_GUARD_REGEX,  message: "Incorrect answer, answer is 'Pick Guard'"
   validates_format_of :finger_2,    with: FINGER_2_REGEX,    message: "Incorrect answer, answer is '2'"
   validates_format_of :finger_3,    with: FINGER_3_REGEX,    message: "Incorrect answer, answer is '3'"
   validates_format_of :finger_4,    with: FINGER_4_REGEX,    message: "Incorrect answer, answer is '4'"
   validates_format_of :finger_1,    with: FINGER_1_REGEX,    message: "Incorrect answer, answer is '1'"
   validates_format_of :finger_t,    with: FINGER_t_REGEX,    message: "Incorrect answer, answer is 't'"
   validates_format_of :finger_m,    with: FINGER_m_REGEX,    message: "Incorrect answer, answer is 'm'"
   validates_format_of :finger_a,    with: FINGER_a_REGEX,    message: "Incorrect answer, answer is 'a'"
   validates_format_of :finger_i,    with: FINGER_i_REGEX,    message: "Incorrect answer, answer is 'i'"
   validates_format_of :finger_c,    with: FINGER_c_REGEX,    message: "Incorrect answer, answer is 'c'"
   validates_format_of :finger_p,    with: FINGER_p_REGEX,    message: "Incorrect answer, answer is 'p'"

end
