class Exam < ApplicationRecord
  belongs_to :competitor, inverse_of: :exam
end
