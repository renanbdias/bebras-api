FactoryBot.define do
  factory :challenge do
    deputy { create(:deputy) }

    name { Faker::Name.first_name }

    start_date { DateTime.now + 1.minute }
    actual_start_date { DateTime.now + 2.minutes }
    end_date { DateTime.now + 45.minutes }
    actual_end_date { DateTime.now + 50.minutes }

    did_start { Faker::Boolean.boolean }
    did_finish { Faker::Boolean.boolean }
    firebase_token { Faker::Internet.password(8) }

  end
end
