FactoryBot.define do
    factory :exam do
      competitor { create :competitor }
      questions { build_list :question, 15 }
    end
  end
