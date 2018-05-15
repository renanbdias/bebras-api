FactoryBot.define do
  factory :deputy do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    password { Faker::Internet.password }
  end

  trait :deputy_with_challenges do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    password { Faker::Internet.password }
    challenges { build_list :challenge, 4 }
  end
end
