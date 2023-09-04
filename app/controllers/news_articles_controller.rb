class NewsArticlesController < ApplicationController
  def index
    @articles = []

    # Scraping logic for each website
    if params[:search].present?
      # @articles += scrape_bbc
      # @articles += scrape_cnn
      @articles += scrape_reuters
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
        @title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
        @content = @doc.xpath('//div/div/p[1]').first.text
        @link = @doc.css('a').first.attr('href')
        @image = @doc.css('img').first.attr('src')
        @published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
        @bbc_articles << NewsArticle.create!(source: 'BBC', title: @title, content: @content, image: @image, link: @link, published: @published)
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
        @title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
        @content = @doc.xpath('//div/div/p[1]').first.text
        @link = @doc.css('a').first.attr('href')
        @image = @doc.css('.image__picture').first.text
        @published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
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
        @title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
        @content = @doc.xpath('//div/div/p[1]').first.text
        @link = @doc.css('a').first.attr('href')
        @image = @doc.css('img').first.attr('src')
        @published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
        raise
        @reuters_articles << NewsArticle.create!(source: 'REUTERS', title: @title, content: @content, image: @image, link: @link, published: @published)
      end
    end
    @reuters_articles
  end
end
