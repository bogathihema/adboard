require 'test_helper'

class AtriclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get atricles_index_url
    assert_response :success
  end

end
