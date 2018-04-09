FactoryBot.define do
    factory :deputy do
        competitor { create(:competitor) }
    end
  end
  