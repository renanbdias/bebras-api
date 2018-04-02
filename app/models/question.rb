class Question < ApplicationRecord
  belongs_to :exam, inverse_of: :questions
  validates :title, :difficulty, :explanation, :name, presence: true
end
