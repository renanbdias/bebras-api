class Exam < ApplicationRecord
  belongs_to :competitor, inverse_of: :exam
  has_many :questions, inverse_of: :exam

  validates :questions, presence: true

end
