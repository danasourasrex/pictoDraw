require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get login_signup_url
    assert_response :success
  end

  test "should get userlogin" do
    get login_userlogin_url
    assert_response :success
  end

end
