class CompetitorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :generated_password, :age, :school_id, :challenge_id, :exam
end