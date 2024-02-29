require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    #@user = User.first
    @user = User.new(name:"BruceKoko", email:"bkl@gmain.com", timezone:"Mountain", lessontime:"11:00AM", lessonday:"Mon", usertype:"GUEST", password:"p4ssw0rdp4ssw0rd")
    puts "First user's name is #{@user[:name]}"

  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be preset" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "email test should be valid by invalid one" do
    @user.email = "abc"
    assert_not @user.valid?
  end

  test "email should be valid by valid email" do
    @user.email = "abc@def.ghi"
    assert @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" *51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.name = "a" * 244 + "@gmail.com"
    assert_not @user.valid?
  end


  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "user should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be min length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


  # TODO: Seems to not like the @user[:name]
# test "should get welcome" do
#   @user.name = "Bruce"
#   get users_welcome_url
#   assert_response :success
# end

end
