require 'test_helper'


#  1) The only way a user can sign up is to schedule an initial lesson.
#     a)  Goes to timezone        (views/scheduler/timezone.html.erb)
#     b)  Goes to calendar        (views/scheduler/calendar.html.erb)
#     c)  Redirects to new user   (views/user/new.html.erg)
#     d)  Than goes to the users welcome page upon successful registration
#         (Note:  user has been created with default password, a link is sent
#                 requesting user to change password, user will not be validated
#                 until this happens)

class UsersSignupTest < ActionDispatch::IntegrationTest


   test "valid signup information" do
      get signup_path
      assert_difference 'User.count', 1 do
         post users_path, params: {user: {name: 'Bruce',
                                          email: 'bruce@gmail.com',
                                          usertype: 'guest',
                                          password: 'password',
                                          password_confirmation: 'password'}}

       end
       # from text book:  assert_template 'users/welcome'
       assert_template 'users/welcome'
   end


   test "invalid signup information" do
      get signup_path
      assert_no_difference 'User.count', 1 do
         post users_path, params: {user: {name: 'Bruce',
                                          email: 'user@invalid',
                                          password: 'foo',
                                          password_confirmation: 'bar'}}

       end
       # from text book:  assert_template 'users/show'
       assert_template 'users/new'
   end

end


