FactoryBot.define do
  factory :competitor do
    name Faker::Name.first_name
    email Faker::Internet.email
    password "secret123"
    generated_password "secret123"
    age Faker::Number.digit
    school { create(:school) }

    challenge { create(:challenge) }

    trait :renan do
      name "Renan Dias"
      email "renan@jera.com.br"
      uid "renan@jera.com.br"
      password "secret123"
      generated_password "secret123"
      challenge { create(:challenge) }
      school { create(:school) }
    end

    trait :competitor_with_exam_and_questions do
      name Faker::Name.first_name
      email Faker::Internet.email
      password "secret123"
      generated_password "secret123"
      challenge { create(:challenge) }
      exam { create(:exam) }
      school { create(:school) }
    end
  end
end
