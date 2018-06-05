class ExamDuration < ApplicationRecord
  # validates :unique_conversion, presence: true
  # validates :unique_conversion, numericality: { greater_than: 0 }

  rails_admin do
  	navigation_label "Gerenciar"
  	label "Duração do Desafio"
  	label_plural "Durações do Desafio"

  end
  
end
