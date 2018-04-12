class Alternative < ApplicationRecord
  belongs_to :question, inverse_of: :alternatives

  validates :alternative_symbol, :description, :html_text, presence: true
end
