require "test_helper"

class Auth::LogoutControllerTest < ActionDispatch::IntegrationTest
  test "should get store" do
    get auth_logout_store_url
    assert_response :success
  end
end
