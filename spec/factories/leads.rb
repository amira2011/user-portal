FactoryBot.define do
  factory :lead do
    first_name { "John" }
    last_name { "Doe" }
    email { Faker::Internet.unique.email }
    phone { Faker::PhoneNumber.unique.phone_number }
    address { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip_code }
    association :user
  end
end
