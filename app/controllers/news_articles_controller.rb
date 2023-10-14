require 'uri'
require 'net/http'
require 'json'

class NewsArticlesController < ApplicationController
  def index
    @articles = []

    # Scraping logic for each website
    if params[:search].present?
      NewsArticle.destroy_all
      @articles += scrape_bbc
      @articles += scrape_politico
      @articles += scrape_al_jazeera
      @articles += scrape_nyt
      @articles += scrape_japan_times

      # Difficult to scrape websites --------------------------------------------------
      # @articles += scrape_cnn
      # @articles += scrape_reuters
      # @articles += scrape_bloomberg
    else
      NewsArticle.destroy_all
      # @articles += scrape_google
    end
    @articles
  end

  def show
    @api = ENV['RAPID_API_KEY'].to_json
    month = Date.today.month
    day = Date.today.day
    url = URI("https://numbersapi.p.rapidapi.com/#{month}/#{day}/date?fragment=true&json=true")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request['X-RapidAPI-Key'] = ENV['RAPID_API_KEY']
    request['X-RapidAPI-Host'] = 'numbersapi.p.rapidapi.com'
    response = http.request(request)
    hash = JSON.parse(response.read_body)
    @fact = hash['text']
    @year = hash['year']
  end

  private

  def scrape_bbc
    if params[:search].present?
      @bbc_articles = []
      @url = "https://www.bbc.co.uk/search?q=#{params[:search][:query].split.join('+')}&seqId=95b35ae0-53a6-11ee-8615-ef58fd8d1f98&d=news_gnl"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @html_doc.search('.ssrcss-rn9nnc-PromoSwitchLayoutAtBreakpoints.et5qctl0').each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @bbc_title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
        @bbc_content = @doc.xpath('//div/div/p[1]').present? ? @doc.xpath('//div/div/p[1]').first.text : nil
        @bbc_link = @doc.css('a').first.attr('href')
        @bbc_image = @doc.css('img').present? ? @doc.css('img').first.attr('src') : nil
        @bbc_published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
        @bbc_articles << NewsArticle.create!(source: 'BBC', title: @bbc_title, content: @bbc_content, image: @bbc_image, link: @bbc_link, published: @bbc_published)
      end
    end
    @bbc_articles
  end

  def scrape_politico
    if params[:search].present?
      @politico_articles = []
      @url = "https://www.politico.com/search?q=#{params[:search][:query].split.join('+')}"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @html_doc.search('.story-frag.format-ml').each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @politico_title = @doc.css('h3').first.text
        @politico_content = @doc.css('.tease').present? ? @doc.css('.tease').first.text : nil
        @politico_link = @doc.css('a').first.attr('href')
        @politico_image = @doc.css('img').present? ? @doc.css('img').first.values[0] : nil
        @politico_published = @doc.css('time').text
        @politico_articles << NewsArticle.create!(source: 'Politico', title: @politico_title, content: @politico_content, image: @politico_image, link: @politico_link, published: @politico_published)
      end
    end
    @politico_articles
  end

  # def scrape_cnn
  #   if params[:search].present?
  #     @cnn_articles = []
  #     # HTTParty Method ---------------------------------------
  #     response = HTTParty.get("https://edition.cnn.com/search?q=#{params[:search][:query].split.join('+')}&from=0&size=10&page=1&sort=newest&types=all&section=")
  #     # parsing the HTML document returned by the server
  #     document = Nokogiri::HTML(response.body)

  #     # Open-Uri Method ----------------------------------------
  #     # @url = "https://edition.cnn.com/search?q=#{params[:search][:query].split.join('+')}&from=0&size=10&page=1&sort=newest&types=all&section="
  #     # @html_file = URI.open(@url).read
  #     # @html_doc = Nokogiri::HTML.parse(@html_file)
  #     # @html_doc.search('.container__headline.container_list-images-with-description__headline').each do |element|
  #     #   @doc = Nokogiri::HTML(element.inner_html)
  #     #   @cnn_title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
  #     #   @cnn_content = @doc.xpath('//div/div/p[1]').first.text
  #     #   @cnn_link = @doc.css('a').first.attr('href')
  #     #   @cnn_image = @doc.css('.image__picture').first.text
  #     #   @cnn_published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
  #     #   @cnn_articles << NewsArticle.create!(source: 'CNN')
  #     # end
  #   end
  #   @cnn_articles
  # end

  # def scrape_reuters
  #   if params[:search].present?
  #     @reuters_articles = []
  #     @url = "https://www.reuters.com/site-search/?query=#{params[:search][:query].split.join('+')}"
  #     @html_file = URI.open(@url).read
  #     @html_doc = Nokogiri::HTML.parse(@html_file)
  #     @html_doc.search('li').each do |element|
  #       @doc = Nokogiri::HTML(element.inner_html)
  #       @reuters_title = @doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
  #       @reuters_content = @doc.xpath('//div/div/p[1]').first.text
  #       @reuters_link = @doc.css('a').first.attr('href')
  #       @reuters_image = @doc.css('img').first.attr('src')
  #       @reuters_published = @doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
  #       @reuters_articles << NewsArticle.create!(source: 'REUTERS', title: @reuters_title, content: @reuters_content, image: @reuters_image, link: @reuters_link, published: @reuters_published)
  #     end
  #   end
  #   @reuters_articles
  # end

  def scrape_nyt
    if params[:search].present?
      @nyt_articles = []
      @url = "https://www.nytimes.com/search?query=#{params[:search][:query].split.join('+')}"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @html_doc.search('.css-1i8vfl5').each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @nyt_title = @doc.css('h4.css-2fgx4k').first.text
        @nyt_content = @doc.css('p.css-16nhkrn').present? ? @doc.css('p.css-16nhkrn').first.text : nil
        @nyt_link = "https://www.nytimes.com#{@doc.css('a').first.attr('href')}"
        @nyt_image = @doc.css('img').present? ? @doc.css('img').first.attr('src') : nil
        @nyt_published = @doc.css('span.css-bc0f0m').text
        @nyt_articles << NewsArticle.create!(source: 'NYT', title: @nyt_title, content: @nyt_content, image: @nyt_image, link: @nyt_link, published: @nyt_published)
      end
    end
    @nyt_articles
  end

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
      @url = "https://www.aljazeera.com/search/#{params[:search][:query].split.join('%20')}"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @html_doc.search('article').each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @al_jazeera_title = @doc.css('span').first.text
        @al_jazeera_content = @doc.css('p').present? ? @doc.css('p').first.text : nil
        @al_jazeera_link = @doc.css('a').first.attr('href')
        @al_jazeera_image = @doc.css('img').present? ? @doc.css('img').first.attr('src') : nil
        @al_jazeera_published = @doc.css('span.screen-reader-text').text
        @al_jazeera_articles << NewsArticle.create!(source: 'Al Jazeera', title: @al_jazeera_title, content: @al_jazeera_content, image: @al_jazeera_image, link: @al_jazeera_link, published: @al_jazeera_published)
      end
    end
    @al_jazeera_articles
  end

  def scrape_japan_times
    if params[:search].present?
      @japan_times_articles = []
      @url = "https://www.japantimes.co.jp/search?query=#{params[:search][:query].split.join('+')}"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML.parse(@html_file)
      @html_doc.search('.article').first(20).each do |element|
        @doc = Nokogiri::HTML(element.inner_html)
        @japan_times_title = @doc.css('.article-title').first.text
        @japan_times_content = @doc.css('.article-body').present? ? @doc.css('.article-body').first.text : nil
        @japan_times_link = @doc.css('a').first.attr('href')
        @japan_times_image = @doc.css('img').present? ? @doc.css('img').first.attr('src') : nil
        @japan_times_published = @doc.css('.publish-date').present? ? @doc.css('.publish-date').text : nil
        @japan_times_articles << NewsArticle.create!(source: 'Japan Times', title: @japan_times_title, content: @japan_times_content, image: @japan_times_image, link: @japan_times_link, published: @japan_times_published)
      end
    end
    @japan_times_articles
  end

  def scrape_google
    @google_articles = []
    @url = 'https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRFZxYUdjU0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen'
    @html_file = URI.open(@url).read
    @html_doc = Nokogiri::HTML.parse(@html_file)
    @html_doc.search('.IBr9hb').first(10).each do |element|
      @doc = Nokogiri::HTML(element.inner_html)
      @google_title = @doc.css('.gPFEn').first.text
      @google_link = "https://news.google.com#{@doc.css('.WwrzSb').first.attr('href')[1..]}"
      @google_image = @doc.css('.Quavad').present? ? @doc.css('.Quavad').first.attr('src') : nil
      @google_articles << NewsArticle.create!(source: 'Google', title: @google_title, image: @google_image, link: @google_link)
    end
    @google_articles
  end
end
