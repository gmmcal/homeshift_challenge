require 'rails_helper'

RSpec.describe Scrapers::AffinityWater do
  it "is a supplier if postcode is within it's region" do
    scraper = Scrapers::AffinityWater.new
    expect(scraper.is_supplier?('AL10 9EZ')).to be(true)
  end

  it 'is not a supplier if postcode is not from region' do
    scraper = Scrapers::AffinityWater.new
    expect(scraper.is_supplier?('EC2A 4BX')).to be(false)
  end
end
