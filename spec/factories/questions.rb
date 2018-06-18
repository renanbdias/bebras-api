FactoryBot.define do
    factory :question do
      name { Faker::Name.title }
      difficulty { Faker::Number.between(1, 5) }
      age_group { Question.age_groups[Faker::Number.between(0, 6)] }
      explanation { Faker::RickAndMorty.quote }
      title { Faker::StarWars.quote }
    end
  end
