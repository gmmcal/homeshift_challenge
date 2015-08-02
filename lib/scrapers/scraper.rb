module Scrapers
  class Scraper
    @url = ""
    @postdata = {}

    def initialize
      raise
    end

    def is_supplier?(postcode)
      false
    end

    def get_http_response
      begin
        RestClient.post @url, @postdata
      rescue => e
        e.response.headers
      end
    end

    def notify(house)
      Rails.logger.info "Notify #{house.supplier} that #{house.tenant.name} is the new tenant of #{house.title}!"
    end
  end
end
