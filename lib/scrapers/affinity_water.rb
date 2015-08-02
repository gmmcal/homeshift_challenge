module Scrapers
  class AffinityWater < Scraper
    def initialize(postcode = nil)
      @url = "https://www.affinitywater.co.uk/index.aspx?pg=79"
    end

    def is_supplier?(postcode)
      @postcode = postcode
      response = get_http_response
      response.include?('supplies your area')
    end

    def get_http_response
      agent = Mechanize.new
      agent.get(@url)
      form = agent.page.forms.first
      form.field_with(id: 'template_txtPostcodePanelSearch').value = @postcode
      form.click_button(form.button_with(id: 'template_btnPostcodePanelSearch'))
      agent.page.search('#template_pnl_area_results').at('h3').text
    end
  end
end
