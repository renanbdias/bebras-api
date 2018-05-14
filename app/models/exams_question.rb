class ExamsQuestion < ApplicationRecord
  has_one :answear, inverse_of :exam_question
end
