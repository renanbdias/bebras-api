class Exam < ApplicationRecord
  belongs_to :competitor, inverse_of: :exam
  has_and_belongs_to_many :questions, inverse_of: :exams

  validates :questions, :competitor, presence: true

  rails_admin do
  	navigation_label "Listar"
  	label "Exame do Competidor"
  	label_plural "Exames do Competidores"

  	field :competitor do
  		label "Competidor"
  	end

  	field :questions do
  		label "Questões"
  	end

  end

end
