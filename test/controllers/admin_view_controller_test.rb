require "test_helper"

class AdminViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_view_index_url
    assert_response :success
  end
end
