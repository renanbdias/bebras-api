class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty, :age_group, :explanation, :title
end
