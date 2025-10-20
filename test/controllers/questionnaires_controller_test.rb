require "test_helper"

class QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get questionnaires_show_url
    assert_response :success
  end

  test "should get create" do
    get questionnaires_create_url
    assert_response :success
  end
end
