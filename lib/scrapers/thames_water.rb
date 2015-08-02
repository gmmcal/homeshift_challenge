require 'scrapers/scraper'

module Scrapers
  class ThamesWater < Scraper
    def initialize(postcode)
      @url = "https://secure.thameswater.co.uk"
      @path = "/dynamic/cps/rde/xchg/corp/hs.xsl/Thames_Water_Supply.xml"
      @postdata = { "postcode1" => postcode}
    end

    def is_supplier?
      response = get_http_response
      response['location'].include?('605_5460')
    end
  end
end
