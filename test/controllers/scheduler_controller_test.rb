require "test_helper"

class SchedulerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get scheduler_show_url
    assert_response :success
  end

  test "should get new" do
    get scheduler_new_url
    assert_response :success
  end

  test "should get calendar" do
    get scheduler_calendar_url
    assert_response :success
  end

  test "should get timezone" do
    get scheduler_timezone_url
    assert_response :success
  end
end
