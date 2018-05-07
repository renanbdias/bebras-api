FactoryBot.define do
  factory :challenge do
    challenge_date { DateTime.now }
    deputy { create(:deputy) }
  end
end
