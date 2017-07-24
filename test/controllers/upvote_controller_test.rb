require 'test_helper'

class UpvoteControllerTest < ActionController::TestCase
  test "should get toggle" do
    get :toggle
    assert_response :success
  end

end
