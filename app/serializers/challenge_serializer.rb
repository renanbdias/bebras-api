class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :competitor_count, :did_start
end
