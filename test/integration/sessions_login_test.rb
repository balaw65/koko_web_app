require "test_helper"

class SessionsLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:koko)
    puts "User login test for: "
    puts @user[:name]
    testHelper
  end


  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "login with valid information" do
    get login_path
    assert_template 'sessions/new'
    sign_in_as(@user)


    # 
#    post login_path, params: {id: 1}, session: { email: @user.email, password: 'password' }
#   assert_redirected_to @user
#   assert_template 'users/show'
#   assert_select "a[href=?]", login_path, count: 0
#   assert_select "a[href=?]", logout_path
#   assert_select "a[href=?]", user_path(@user)
  end


end
