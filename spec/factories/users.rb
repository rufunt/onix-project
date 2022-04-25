FactoryBot.define do
  factory :user do
    first_name { Faker::FunnyName.name }
    last_name { "MyString" }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.base64 }
  end
end
