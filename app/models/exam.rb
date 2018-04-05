class Exam < ApplicationRecord
  belongs_to :competitor, inverse_of: :exam
  has_and_belongs_to_many :questions, inverse_of: :exams

  validates :questions, presence: true
end
