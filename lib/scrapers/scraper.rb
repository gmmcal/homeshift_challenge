require 'nokogiri'

module Scrapers
  class Scraper
    def is_supplier?
      false
    end

    def get_http_response
      uri = URI.parse(@url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      request = Net::HTTP::Post.new(@path)
      # request.content_type = { charset: 'utf8'}
      request.set_form_data(@postdata)
      http.request(request)
    end
  end
end
