require "test_helper"

class L1L4QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get l1_l4_questions_new_url
    assert_response :success
  end

  test "should get show" do
    get l1_l4_questions_show_url
    assert_response :success
  end

  test "should get edit" do
    get l1_l4_questions_edit_url
    assert_response :success
  end

  test "should get create" do
    get l1_l4_questions_create_url
    assert_response :success
  end
end
