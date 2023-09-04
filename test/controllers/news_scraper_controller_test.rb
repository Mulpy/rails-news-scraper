require "test_helper"

class NewsScraperControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get news_scraper_index_url
    assert_response :success
  end
end
