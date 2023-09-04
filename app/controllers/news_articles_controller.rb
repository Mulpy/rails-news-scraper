class NewsArticlesController < ApplicationController
  def index
    @articles = []

      # Scraping logic for each website
      @articles += scrape_bbc
      @articles += scrape_cnn
      # Add more websites as needed

      # Display the results
      render 'index'
    end

    private

    def scrape_bbc
      if params[:search].present?
        NewsArticle.source = 'BBC'
        url = "https://www.bbc.co.uk/search?q=#{params[:search][:query]}&d=news_gnl"
        html_file = URI.open(url).read
        html_doc = Nokogiri::HTML.parse(html_file)
        doc = Nokogiri::HTML(element.inner_html)
        title = doc.css('p.ssrcss-6arcww-PromoHeadline.exn3ah96 span').first.text
        content = doc.xpath('//div/div/p[1]').first.text
        link = doc.css('a').first.attr('href')
        image = doc.css('img').first.attr('src')
        published = doc.css('span.ssrcss-1if1g9v-MetadataText.e4wm5bw1').text
        html_doc.search(".ssrcss-rn9nnc-PromoSwitchLayoutAtBreakpoints.et5qctl0").each do |element|
          NewsArticle.create!(source: 'BBC', title: title, content: content, image: image )

      # Implement web scraping logic for website 1 here
      # Use Nokogiri or other scraping libraries
      # Return an array of NewsArticle objects
    end

    def scrape_cnn
      if params[:search].present?
        NewsArticle.source = 'CNN'
        url = "https://edition.cnn.com/search?q=#{params[:search][:query]}&from=0&size=10&page=1&sort=newest&types=all&section= "
        html_file = URI.open(url).read
        html_doc = Nokogiri::HTML.parse(html_file)
        # Implement web scraping logic for website 2 here
      # Use Nokogiri or other scraping libraries
      # Return an array of NewsArticle objects
    end
  end
end
