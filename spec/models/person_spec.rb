require 'rails_helper'

RSpec.describe Person, type: :model do
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:nin) }
  it { expect(subject).to have_one(:house) }

  it 'has a valid factory' do
    expect(build(:person)).to be_valid
  end

  context 'is invalid' do
    it 'without a name' do
      person = build(:person, name: nil)
      person.valid?
      expect(person.errors[:name]).to include("can't be blank")
    end

    it 'without a nin' do
      person = build(:person, nin: nil)
      person.valid?
      expect(person.errors[:nin]).to include("can't be blank")
    end
  end

  context 'is valid' do
  end
end
