class Challenge < ApplicationRecord
  belongs_to :deputy, inverse_of: :challenges
  has_many :competitors, inverse_of: :challenge, dependent: :destroy

  validates :start_date, :end_date, :deputy, :name, presence: true

  def competitor_count
    self.competitors.count
  end

  def duration
    ExamDuration.first.exam_duration_in_minutes
  end


  rails_admin do
  	navigation_label "Listar"
  	label "Desafio"
  	label_plural "Desafios"

  	field :name do
  		label "Nome"
  	end

  	field :start_date do
  		label "Data de Início"
  	end

  	field :end_date do
  		label "Data de Fim"
  	end
  	
  	field :deputy do
  		label "Delegado Responsável"
  		help "É o delegado responsável pela criação do desafio"
  	end

  end

end
