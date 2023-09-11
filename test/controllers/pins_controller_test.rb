require "test_helper"

class PinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pins_index_url
    assert_response :success
  end

  test "should get show" do
    get pins_show_url
    assert_response :success
  end
end
