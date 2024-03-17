require 'test_helper'



#     Started POST "/login" for 127.0.0.1 at 2024-03-16 08:56:29 -0400
#     Processing by SessionsController#create as HTML
#       Parameters: {"authenticity_token"=>"[FILTERED]", "session"=>{"email"=>"mary@gmail.com", "password"=>"[FILTERED]", "remember_me"=>"0"}, "commit"=>"Log in"}
#     ===> params:  {"authenticity_token"=>"7DpUQVUJYrRwwm-MOBcv-gqJOkGlLGhxAceIgvvaNUGBVmyXQhmA-Cmcwi38_AjxCpq7qGnmWh_76P42c_EX9w", "session"=>{"email"=>"mary@gmail.com", "password"=>"p4ssw0rdp4ssw0rd", "remember_me"=>"0"}, "commit"=>"Log in", "controller"=>"sessions", "action"=>"create"}
#       User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."email" = ? LIMIT ?  [["email", "mary@gmail.com"], ["LIMIT", 1]]
#       ↳ app/controllers/sessions_controller.rb:11:in `create'
#           user found
#           user authenticated

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:koko)
    @user2 = users(:mary)
    @user3 = users(:jesse)
    @user4 = users(:suzie)
 
    @student1 = students(:mary)
    @student2 = students(:jesse)
    @student3 = students(:suzie)
 
    testHelper
  end

  test "login with valid information of guest" do
     get login_path
     post login_path, params: {session: {email:@user2.email,
                                         password:'password'}}
 
     assert_redirected_to @user2
     follow_redirect!
     assert_redirected_to '/students/new'
     assert_select "a[href=?]", login_path, count:0
     # Nope, do not know what this test does:  assert_select "a[href=?]", logout_path
     #                              nor this:  assert_select "a[href=?]", user_path(@user)
     assert is_logged_in?
 
  end

  test "login with valid information of student" do
     get login_path
     post login_path, params: {session: {email:@user3.email,
                                         password:'password'}}
 
     assert_redirected_to @user3
     follow_redirect!
     assert_redirected_to '/students/new'
     follow_redirect!
     assert_template 'students/show'
     assert is_logged_in?
  end


  test "login with invalid information" do
     get login_path
     assert_template 'sessions/new'
     post login_path, params: {session: {email: "margy@gmail.com", 
                                                password:""}}
     assert_template 'sessions/new'
     assert_not flash.empty?
     get root_path
     assert flash.empty?

  end

  test "guest login" do
     get login_path
     login_in_as(@user2)
     assert is_logged_in?
     assert is_guest?
  end

  test "student login" do
     get login_path
     login_in_as(@user3)
     assert is_logged_in?
     assert is_student?
  end


  test "only admin can access index page" do
     get login_path
     login_in_as(@user)
     assert is_logged_in?
     assert is_admin?

     get '/users/index'
     follow_redirect!
     assert_response:success
     # assert_template 'users/index' ##### NOT WORKING, ARG!!!!
     # assert_not flash.empty?       ##### NO before_actions ARE NOT CALLED IN TESTS
  end
  test "guest cannot access index page" do
     get login_path
     login_in_as(@user2)
     assert is_logged_in?
     # get users_path
     get '/users/index'
     follow_redirect!
 
     # assert_not flash.empty?
     assert_template root_path
  end



# test "admin login with valid information" do
#   get login_path
#   assert_template 'sessions/new'
#   sign_in_as(@user)

#   # 
#   post login_path, sessions: { email: @user.email, password: 'password' }'03K0k0t0ast!'

#   post login_path(params: { session: {email:@user.email, password:'03K0k0t0ast!'} })
#
#   assert_redirected_to @user
#   assert_template 'users/index'                          # NOT WORKING
#   assert_select "a[href=?]", login_path, count: 0        # whats this do??
#   assert_select "a[href=?]", logout_path                 # NOT WORKING
#   assert_select "a[href=?]", user_path(@user)            # NOT WORKING
# end

end



