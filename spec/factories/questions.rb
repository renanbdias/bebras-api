FactoryBot.define do
    factory :competitor do
      name { Faker::Name.title }
      difficulty { Faker::Number.between(1, 5) }
      age_group { Faker::Number.between(1, 10) }
      explanation { Faker::RickAndMorty.quote }
      title { Faker::StarWars.quote }
    end
  end
  