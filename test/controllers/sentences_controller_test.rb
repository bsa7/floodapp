require 'test_helper'

class SentencesControllerTest < ActionController::TestCase
  test "should get sampler" do
    get :sampler
    assert_response :success
  end

end
