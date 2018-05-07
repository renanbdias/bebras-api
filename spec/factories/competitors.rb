FactoryBot.define do
  factory :competitor do
    name Faker::Name.first_name
    email Faker::Internet.email
    password Faker::Internet.password
    challenge { create :challenge }

    trait :renan do
      name "Renan Dias"
      email "renan@jera.com.br"
      uid "renan@jera.com.br"
      password "secret123"
      challenge { create :challenge }
    end

    trait :competitor_with_exam_and_questions do
      name Faker::Name.first_name
      email Faker::Internet.email
      password Faker::Internet.password
      challenge { create :challenge }
      exam { create :exam }
    end
  end
end
