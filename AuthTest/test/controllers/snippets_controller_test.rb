require 'test_helper'

class SnippetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get snippets_new_url
    assert_response :success
  end

  test "should get show" do
    get snippets_show_url
    assert_response :success
  end

end
