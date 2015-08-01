FactoryGirl.define do
  factory :person do
    name { Faker::Name.name }
    nin { Faker::Code.ean }

    factory :invalid_person do
      name nil
    end
  end
end
