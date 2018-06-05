class School < ApplicationRecord
  has_many :deputies, inverse_of: :school
  has_many :competitors, inverse_of: :school

  validates :name, :phone, :address, :cep, :city, :state, presence: true

  rails_admin do
  	navigation_label "Listar"
  	label "Instituição de Ensino"
  	label_plural "Instituições de Ensino"

  	field :name do
  		label "Nome"
  	end

  	field :phone do
  		label "Telefone"
  	end
  	
  	field :address do
  		label "Endereço"
  	end

  	field :cep do
  		label "CEP"
  	end

  	field :city do
  		label "Cidade"
  	end

  	field :state do
  		label "Estado"
  	end

  	field :deputies do
  		label "Lista de Delegados"
  	end

  end

end
