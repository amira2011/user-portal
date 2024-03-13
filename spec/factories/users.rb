# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    # Assuming your User model has these attributes. Adjust as needed.
    name { "John Doe" }
    email { "john.doe@example.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
