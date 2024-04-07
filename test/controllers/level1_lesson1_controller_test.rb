require "test_helper"

class Level1Lesson1ControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get level1_lesson1_new_url
    assert_response :success
  end

  test "should get show" do
    get level1_lesson1_show_url
    assert_response :success
  end

  test "should get edit" do
    get level1_lesson1_edit_url
    assert_response :success
  end

  test "should get delete" do
    get level1_lesson1_delete_url
    assert_response :success
  end
end
