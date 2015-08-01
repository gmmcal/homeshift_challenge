FactoryGirl.define do
  factory :person do
    name { Faker::Name.name }
    nin { Faker::Code.ean }
  end
end
