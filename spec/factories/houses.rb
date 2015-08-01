FactoryGirl.define do
  factory :house do
    title { Faker::Lorem.words(4) }
    description { Faker::Lorem.paragraph(2) }
    address { Faker::Address.street_address }
    postcode { Faker::Address.zip_code }
    tenant nil
  end
end
