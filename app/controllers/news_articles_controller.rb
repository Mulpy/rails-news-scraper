class NewsArticlesController < ApplicationController
  def index
    @articles = []

    # Scraping logic for each website
    if params[:search].present?
      # @articles += scrape_bbc
      # @articles += scrape_cnn
      # @articles += scrape_reuters
      # @articles += scrape_nyt
      # @articles += scrape_bloomberg
      # @articles += scrape_al_jazeera
      @articles += scrape_japan_times
    end
    @articles
  end

  private

  def scrape_bbc
    if params[:search].present?
      @bbc_articles = []
      @url = "https://www.bbc.co.uk/search?q=#{params[:search][:query]}&seqId=95b35ae0-53a6-11ee-8615-ef58fd8d1f98&d=news_gnl"
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

  # def scrape_cnn
  #   if params[:search].present?
  #     @cnn_articles = []
  #     @url = "https://edition.cnn.com/search?q=#{params[:search][:query]}&from=0&size=10&page=1&sort=newest&types=all&section="
  #     @html_file = URI.open(@url).read
  #     @html_doc = Nokogiri::HTML.parse(@html_file)
  #     @html_doc.search('.container__headline.container_list-images-with-description__headline').each do |element|
  #       @doc = Nokogiri::HTML(element.inner_html)
  #       @cnn_title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
  #       @cnn_content = @doc.xpath('//div/div/p[1]').first.text
  #       @cnn_link = @doc.css('a').first.attr('href')
  #       @cnn_image = @doc.css('.image__picture').first.text
  #       @cnn_published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
  #       @cnn_articles << NewsArticle.create!(source: 'CNN')
  #     end
  #   end
  #   @cnn_articles
  # end

  # def scrape_reuters
  #   if params[:search].present?
  #     @reuters_articles = []
  #     @url = "https://www.reuters.com/site-search/?query=#{params[:search][:query]}"
  #     @html_file = URI.open(@url).read
  #     @html_doc = Nokogiri::HTML.parse(@html_file)
  #     @html_doc.search('div.media-story-card__legal__3kqtT').each do |element|
  #       @doc = Nokogiri::HTML(element.inner_html)
  #       @reuters_title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
  #       @reuters_content = @doc.xpath('//div/div/p[1]').first.text
  #       @reuters_link = @doc.css('a').first.attr('href')
  #       @reuters_image = @doc.css('img').first.attr('src')
  #       @reuters_published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
  #       @reuters_articles << NewsArticle.create!(source: 'REUTERS')
  #     end
  #   end
  #   @reuters_articles
  # end

  # def scrape_nyt
  #   if params[:search].present?
  #     @nyt_articles = []
  #     @url = "https://www.nytimes.com/search?query=#{params[:search][:query]}"
  #     @html_file = URI.open(@url).read
  #     @html_doc = Nokogiri::HTML.parse(@html_file)
  #     @html_doc.search('.css-1i8vfl5').each do |element|
  #       @doc = Nokogiri::HTML(element.inner_html)
  #       @nyt_title = @doc.css('h4.css-2fgx4k').first.text
  #       @nyt_content = @doc.css('p.css-16nhkrn').first.text
  #       @nyt_link = "https://www.nytimes.com#{@doc.css('a').first.attr('href')}"
  #       @nyt_image = @doc.css('img').first.attr('src')
  #       @nyt_published = @doc.css('span.css-bc0f0m').text
  #       @nyt_articles << NewsArticle.create!(source: 'NYT', title: @nyt_title, content: @nyt_content, image: @nyt_image, link: @nyt_link, published: @nyt_published)
  #     end
  #   end
  #   @nyt_articles
  # end

  # def scrape_bloomberg
  #   if params[:search].present?
  #     @bloomberg_articles = []
  #     @url = "https://www.bloomberg.com/search?query=#{params[:search][:query]}"
  #     @html_file = URI.open(@url).read
  #     @html_doc = Nokogiri::HTML.parse(@html_file)
  #     @html_doc.search('.storyItem__aaf871c1c5').each do |element|
  #       @doc = Nokogiri::HTML(element.inner_html)
  #       @bloomberg_title = @doc.css('h4.css-2fgx4k').first.text
  #       @bloomberg_content = @doc.css('p.css-16nhkrn').first.text
  #       @bloomberg_link = "https://www.bloombergimes.com#{@doc.css('a').first.attr('href')}"
  #       @bloomberg_image = @doc.css('img').first.attr('src')
  #       @bloomberg_published = @doc.css('span.css-bc0f0m').text
  #       @bloomberg_articles << NewsArticle.create!(source: 'bloomberg', title: @bloomberg_title, content: @bloomberg_content, image: @bloomberg_image, link: @bloomberg_link, published: @bloomberg_published)
  #     end
  #   end
  #   @bloomberg_articles
  #   raise
  # end

  def scrape_al_jazeera
    if params[:search].present?
      @al_jazeera_articles = []
      @url = "https://www.aljazeera.com/search/#{params[:search][:query]}"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @html_doc.search('article').each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @al_jazeera_title = @doc.css('span').first.text
        @al_jazeera_content = @doc.css('p').first.text
        @al_jazeera_link = @doc.css('a').first.attr('href')
        @al_jazeera_image = @doc.css('img').first.attr('src')
        @al_jazeera_published = @doc.css('span.screen-reader-text').text
        @al_jazeera_articles << NewsArticle.create!(source: 'Al Jazeera', title: @al_jazeera_title, content: @al_jazeera_content, image: @al_jazeera_image, link: @al_jazeera_link, published: @al_jazeera_published)
      end
    end
    @al_jazeera_articles
  end

  def scrape_japan_times
    if params[:search].present?
      @japan_times_articles = []
      @url = "https://www.japantimes.co.jp/search?query=#{params[:search][:query]}"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @html_doc.search('article').each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @japan_times_title = @doc.css('.article-title').first.text
        @japan_times_content = @doc.css('.article-body').first.text
        @japan_times_link = @doc.css('a').first.attr('href')
        @japan_times_image = @doc.css('img').first.attr('src')
        @japan_times_published = @doc.css('.publish-date').text
        @japan_times_articles << NewsArticle.create!(source: 'Japan Times', title: @japan_times_title, content: @japan_times_content, image: @japan_times_image, link: @japan_times_link, published: @japan_times_published)
      end
    end
    @japan_times_articles
    raise
  end
end
