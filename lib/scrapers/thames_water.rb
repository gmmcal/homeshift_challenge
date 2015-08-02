module Scrapers
  class ThamesWater < Scraper
    def initialize
      @url = "https://secure.thameswater.co.uk/dynamic/cps/rde/xchg/corp/hs.xsl/Thames_Water_Supply.xml"
    end

    def is_supplier?(postcode)
      @postdata = { "postcode1" => postcode}
      response = get_http_response
      response[:location].include?('605_5460')
    end
  end
end
