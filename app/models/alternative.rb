class Alternative < ApplicationRecord
  belongs_to :question, inverse_of: :alternatives

  has_one :exams_question, inverse_of: :alternative

  has_one :right_alternative, class_name: "Question", foreign_key: "right_alternative_id"

  validates :alternative_symbol, :description, :html_text, presence: true

  rails_admin do
  	navigation_label "Gerenciar"
  	label "Alternativa"
  	label_plural "Alternativas"

  	field :alternative_symbol do
  		label "Simbolo da alternativa"
  		help "É o simbolo de representação da alternativa (É recomendável escolher os símbolos A , B , C ou D)."
  	end

  	field :html_text do
  		label "Html da alternativa"
  		help "É o texto da alternativa no formato de html."
  	end

  	field :question do
  		label "Questão"
  		help "É a questão em que alternativa está relacionada."
  	end

  	field :description do
  		label "Descrição"
  		help "É uma breve descrição a sobre alternativa."
  	end

  end


end
