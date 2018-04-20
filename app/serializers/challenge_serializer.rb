class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :competitor_count, :did_start, :firebase_token, :current_date, :exam_end_date, :duration, :did_finish
end
