require "test_helper"

class FaqsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get faqs_index_url
    assert_response :success
  end
end
