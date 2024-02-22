require 'test_helper'

class NewsApiIntegrationTest < ActionDispatch::IntegrationTest
  def setup
  end

  test "should get news from API" do
    get "/news"

    assert_response :success
    assert_not_empty response.body
  end
end