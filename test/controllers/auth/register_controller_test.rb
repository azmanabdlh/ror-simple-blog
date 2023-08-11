require "test_helper"

class Auth::RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auth_register_index_url
    assert_response :success
  end

  test "should get store" do
    get auth_register_store_url
    assert_response :success
  end
end
