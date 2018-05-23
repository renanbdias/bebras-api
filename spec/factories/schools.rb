FactoryBot.define do
  factory :school do
    name Faker::University.name
    phone Faker::PhoneNumber.phone_number
    address Faker::Address.street_address
    cep Faker::Address.zip_code
    city Faker::Address.city
    state Faker::Address.state
  end
end