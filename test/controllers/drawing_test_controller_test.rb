require 'test_helper'

class DrawingTestControllerTest < ActionDispatch::IntegrationTest
  test "should get draw" do
    get drawing_test_draw_url
    assert_response :success
  end

end
