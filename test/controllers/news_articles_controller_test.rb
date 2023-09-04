require "test_helper"

class NewsArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get news_articles_index_url
    assert_response :success
  end
end
