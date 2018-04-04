class Question < ApplicationRecord
  has_and_belongs_to_many :exams, inverse_of: :questions

  validates :title, :difficulty, :explanation, :name, presence: true
end
