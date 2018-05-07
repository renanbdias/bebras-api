class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :competitor_count, :did_start, :firebase_token, :duration, :did_finish, :actual_start_date, :actual_end_date
end
