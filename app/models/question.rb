class Question < ApplicationRecord
  has_and_belongs_to_many :exams, inverse_of: :questions
  has_many :alternatives, inverse_of: :question

  belongs_to :right_alternative, class_name: "Alternative", optional: true

  validates :title, :difficulty, :explanation, :age_group, :name, :html, presence: true

  accepts_nested_attributes_for :alternatives, allow_destroy: true 

  rails_admin do
  	navigation_label "Gerenciar"
  	label "Questão"
  	label_plural "Questões"

  	field :name do
  		label "Nome"
  		help "É o nome da questão."
  	end

  	field :difficulty do
  		label "Dificuldade"
  		help "É o grau de dificuldade da questão (1 - Fácil , 2 - Médio, 3 - Difícil)."
  	end

  	field :age_group do
  		label "Grupo de Idade"
  		help "É o grupo de idade que a questão pertence (1 - [5 à 8 anos], 2 - [8 à 10 anos], 3 - [10 à 12 anos], 4 - [12 à 14 anos], 5 - [14 à 16 anos], 6 - [16 à 19 anos])."
  	end

  	field :explanation do
  		label "Enunciado"
  		help "É o breve texto de contexto da questão."
  	end

  	field :title do
  		label "Pergunta"
  		help "É a pergunta da questão."
  	end

  	field :html do
  		label "Html"
  		help "É o html da questão."
  	end

    field :alternatives do
  		label "Alternativa"
  		help "São as alternativas que compõem a questão."
  	end 	

  	field :exams do
  		label "Exames"
  		help "São os exames em que a questão poderá ser utilizada."
  	end

    edit do
      field :name do
        label "Nome"
        help "É o nome da questão."
      end

      field :difficulty do
        label "Dificuldade"
        help "É o grau de dificuldade da questão (1 - Fácil , 2 - Médio, 3 - Difícil)."
      end

      field :age_group do
        label "Grupo de Idade"
        help "É o grupo de idade que a questão pertence (1 - [5 à 8 anos], 2 - [8 à 10 anos], 3 - [10 à 12 anos], 4 - [12 à 14 anos], 5 - [14 à 16 anos], 6 - [16 à 19 anos])."
      end

      field :explanation do
        label "Enunciado"
        help "É o breve texto de contexto da questão."
      end

      field :title do
        label "Pergunta"
        help "É a pergunta da questão."
      end

      field :html do
        label "Html"
        help "É o html da questão."
      end

      field :alternatives do
        label "Alternativa"
        help "São as alternativas que compõem a questão."
      end 

      field :right_alternative do
        label "Alternativa Correta"
        help "É alternativa correta da questão."
      end   

      field :exams do
        label "Exames"
        help "São os exames em que a questão poderá ser utilizada."
      end

    end

  end

end
