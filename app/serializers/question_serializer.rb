class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :name, :html

  has_many :alternatives
end
