require 'test_helper'

# To figure out post, this is displayed from rails server:
#   Started POST "/students" for 127.0.0.1 at 2024-03-15 12:17:37 -0400
#   Processing by StudentsController#create as HTML
#     Parameters: {"authenticity_token"=>"[FILTERED]", "student"=>{"active"=>"false", "favoritegenre"=>"blues", "interests"=>"My Rock", "currentlevel"=>"1", "currentlesson"=>"1", "startingdate"=>"04/01/2024"}, "commit"=>"Submit"}
#     User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 9], ["LIMIT", 1]]


class StudentTest < ActionDispatch::IntegrationTest

   def setup
      current_user = users(:koko)
   end

   # the test, however fails because it can't find current_user.email:
   test "Test post of student data" do
         post students_path, params: {student: {active: "false",
                                          favoritegenre: "blues",
                                          interests: "My Rock",
                                          currentlevel: 1,
                                          currentlesson: 1,
                                          startingdate: "04/04/2024"}}
    end

end


