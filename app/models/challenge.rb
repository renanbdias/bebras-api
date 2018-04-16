class Challenge < ApplicationRecord
  belongs_to :deputy, inverse_of: :challenges
  has_many :competitors, inverse_of: :challenge

  validates :start_date, :deputy, :name, presence: true

  def competitor_count
    self.competitors.count
  end

end
