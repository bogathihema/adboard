require 'test_helper'

class AdboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get adboards_create_url
    assert_response :success
  end

  test "should get index" do
    get adboards_index_url
    assert_response :success
  end

end
