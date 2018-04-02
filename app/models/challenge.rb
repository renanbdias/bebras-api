class Challenge < ApplicationRecord
  has_many :competitors, inverse_of: :challenge
  belongs_to :deputy, inverse_of: :challenges

end
