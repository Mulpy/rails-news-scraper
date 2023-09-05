class NewsArticlesController < ApplicationController
  def index
    @articles = []

    # Scraping logic for each website
    if params[:search].present?
      @articles += scrape_bbc
      # @articles += scrape_cnn
      # @articles += scrape_reuters
    end
    @articles
  end

  private

  def scrape_bbc
    if params[:search].present?
      @bbc_articles = []
      @url = "https://www.bbc.co.uk/search?q=#{params[:search][:query]}&d=news_gnl"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @html_doc.search('.ssrcss-rn9nnc-PromoSwitchLayoutAtBreakpoints.et5qctl0').each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @bbc_title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
        @bbc_content = @doc.xpath('//div/div/p[1]').first.text
        @bbc_link = @doc.css('a').first.attr('href')
        @bbc_image = @doc.css('img').first.attr('src')
        @bbc_published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
        @bbc_articles << NewsArticle.create!(source: 'BBC', title: @bbc_title, content: @bbc_content, image: @bbc_image, link: @bbc_link, published: @bbc_published)
      end
    end
    @bbc_articles
  end

  def scrape_cnn
    if params[:search].present?
      @cnn_articles = []
      @url = "https://edition.cnn.com/search?q=#{params[:search][:query]}&from=0&size=10&page=1&sort=newest&types=all&section="
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @selected_div = @html_doc.css('div.container__text.container_list-images-with-description__text').each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @cnn_title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
        @cnn_content = @doc.xpath('//div/div/p[1]').first.text
        @cnn_link = @doc.css('a').first.attr('href')
        @cnn_image = @doc.css('.image__picture').first.text
        @cnn_published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
        @cnn_articles << NewsArticle.create!(source: 'CNN')
      end
    end
    @cnn_articles
  end

  def scrape_reuters
    if params[:search].present?
      @reuters_articles = []
      @url = "https://www.reuters.com/site-search/?query=#{params[:search][:query]}"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @html_doc.search('.media-story-card__legal__3kqtT').each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @reuters_title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
        @reuters_content = @doc.xpath('//div/div/p[1]').first.text
        @reuters_link = @doc.css('a').first.attr('href')
        @reuters_image = @doc.css('img').first.attr('src')
        @reuters_published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
        @reuters_articles << NewsArticle.create!(source: 'REUTERS')
      end
    end
    @reuters_articles
  end
end
