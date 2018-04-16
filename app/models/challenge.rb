class Challenge < ApplicationRecord
  belongs_to :deputy, inverse_of: :challenges
  has_many :competitors, inverse_of: :challenge

  validates :challenge_date, presence: true

end
