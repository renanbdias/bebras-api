class Question < ApplicationRecord
  has_and_belongs_to_many :exams, inverse_of: :questions
  has_many :alternatives, inverse_of: :question

  belongs_to :right_alternative, class_name: "Alternative", optional: true

  validates :title, :difficulty, :explanation, :age_group, :name, presence: true
end
