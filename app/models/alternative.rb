class Alternative < ApplicationRecord
  belongs_to :question, inverse_of: :alternatives

  has_one :right_alternative, class_name: "Question", foreign_key: "right_alternative_id"

  validates :alternative_symbol, :description, :html_text, presence: true
end
