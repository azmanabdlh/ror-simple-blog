require "test_helper"

class Auth::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auth_login_index_url
    assert_response :success
  end

  test "should get store" do
    get auth_login_store_url
    assert_response :success
  end
end
