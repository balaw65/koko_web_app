require "test_helper"

class StudentTest < ActiveSupport::TestCase
   def setup
      @student = Student.new(email: "user@example.com", 
                             favoritegenre:"jazz",interests:"foobar",
                             currentlevel:1,
                             currentlesson:1,startingdate:"03/21/2024")
   end

   test "the truth" do
     assert true
   end
 
   test "student should be valid" do
      assert @student.valid?
   end

   test "starting date should be present" do
      @student.startingdate = ""
      assert_not @student.valid?
   end

   test "starting dates should be valid" do
      valid_dates =  %w[05/01/2025 09/30/2026 01/23/2027]
      valid_dates.each do |valid_date|
         @student.startingdate = valid_date
         assert @student.valid?, "#{valid_date.inspect} should be valid"
      end
   end

   test "starting dates should reject invalid dates" do
      invalid_dates =  %w[0501/2025 09/302026 01232027]
      invalid_dates.each do |invalid_date|
         @student.startingdate = invalid_date
         assert_not @student.valid?, "#{invalid_date.inspect} should not be valid"
      end
   end

   test "current level should reject out of range numbers" do
      invalid_levels = %w[0 51 52 53]
      invalid_levels.each do |invalid_level|
         @student.currentlevel = invalid_level
         assert_not @student.valid?, "#{invalid_level.inspect} should not be valid"
      end
   end

   test "current lesson should reject out of range numbers" do
      invalid_lessons = %w[0 51 52 53]
      invalid_lessons.each do |invalid_lesson|
         @student.currentlesson = invalid_lesson
         assert_not @student.valid?, "#{invalid_lesson.inspect} should not be valid"
      end
   end

   test "genre should be present" do
      @student.favoritegenre = ""
      assert_not @student.valid?
   end

   test "interests should be present" do
      @student.interests = ""
      assert_not @student.valid?
   end




end
