class ExamsQuestion < ApplicationRecord
  belongs_to :alternative, inverse_of: :exams_question
end
