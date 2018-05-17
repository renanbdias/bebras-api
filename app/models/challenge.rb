class Challenge < ApplicationRecord
  belongs_to :deputy, inverse_of: :challenges
  has_many :competitors, inverse_of: :challenge, dependent: :destroy

  validates :start_date, :end_date, :deputy, :name, presence: true

  def competitor_count
    self.competitors.count
  end

  def duration
    ExamDuration.first.exam_duration_in_minutes
  end

end
