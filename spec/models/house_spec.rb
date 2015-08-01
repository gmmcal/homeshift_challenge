require 'rails_helper'

RSpec.describe House, type: :model do
  it { expect(subject).to validate_presence_of(:title) }
  it { expect(subject).to validate_presence_of(:address) }
  it { expect(subject).to validate_presence_of(:postcode) }
  it { expect(subject).to belong_to(:tenant) }

  it 'has a valid factory' do
    expect(build(:house)).to be_valid
  end

  context 'is invalid' do
    it 'without a title' do
      house = build(:house, title: nil)
      house.valid?
      expect(house.errors[:title]).to include("can't be blank")
    end

    it 'without a address' do
      house = build(:house, address: nil)
      house.valid?
      expect(house.errors[:address]).to include("can't be blank")
    end
  end

  context 'is valid' do
    it 'without a description' do
      house = build(:house, description: nil)
      expect(house.valid?).to eq(true)
    end

    it 'without a tenant' do
      house = build(:house, tenant: nil)
      expect(house.valid?).to eq(true)
    end
  end
end
