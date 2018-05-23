FactoryBot.define do
  factory :deputy do
    name Faker::Name.first_name
    email Faker::Internet.email
    phone Faker::PhoneNumber.phone_number
    password Faker::Internet.password
    school { create(:school) }
  end

  trait :deputy_with_challenges do
    name Faker::Name.first_name
    email Faker::Internet.email
    phone Faker::PhoneNumber.phone_number
    password Faker::Internet.password
    challenges { build_list(:challenge, 4) }
    school { create(:school) }
  end
end
