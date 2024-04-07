require "test_helper"

class L1L1QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get l1_l1_questions_new_url
    assert_response :success
  end

  test "should get edit" do
    get l1_l1_questions_edit_url
    assert_response :success
  end
end
