class Question < ApplicationRecord
  belongs_to :exam, inverse_of: :questions
end
