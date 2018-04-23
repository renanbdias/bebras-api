class AlternativeSerializer < ActiveModel::Serializer
  attributes :id, :alternative_symbol, :description, :html_text, :question_id

  belongs_to :question
end
