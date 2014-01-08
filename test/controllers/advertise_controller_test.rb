require 'test_helper'

class AdvertiseControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
