require 'test_helper'

class ChatTestControllerTest < ActionDispatch::IntegrationTest
  test "should get chatroom" do
    get chat_test_chatroom_url
    assert_response :success
  end

end
