FactoryGirl.define do
  factory :house do
    title { Faker::Lorem.words(4).join(' ') }
    description { Faker::Lorem.paragraph(2) }
    address { Faker::Address.street_address }
    postcode { Faker::Address.zip_code }
    person_id nil
    supplier nil

    factory :invalid_house do
      title nil
    end
  end
end
