require 'test_helper'

class EmoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get emo_show_url
    assert_response :success
  end

  test "should get create" do
    get emo_create_url
    assert_response :success
  end

end
