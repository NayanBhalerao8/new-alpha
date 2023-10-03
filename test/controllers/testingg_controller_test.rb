require "test_helper"

class TestinggControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testingg_index_url
    assert_response :success
  end
end
