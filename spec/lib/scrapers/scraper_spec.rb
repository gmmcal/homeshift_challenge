require 'rails_helper'

RSpec.describe Scrapers::Scraper do
  it "cannot be initialized" do
    expect { Scrapers::Scraper.new }.to raise_error(RuntimeError)
  end
end
