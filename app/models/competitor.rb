class Competitor < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  belongs_to :challenge, inverse_of: :competitors
  belongs_to :school, inverse_of: :competitors
  has_one :exam, inverse_of: :competitor, dependent: :destroy

  validates :name, :email, :generated_password, :age, :school, presence: true

  rails_admin do
  	navigation_label "Listar"
  	label "Competidor"
  	label_plural "Competidores"

  	field :name do
  		label "Nome Completo"
  	end

  	field :email do
  		label "E-mail"
  	end

  	field :age do
  		label "Idade"
  	end

  	field :challenge do
  		label "Desafio"
  	end

  	field :school do
  		label "Instituição de Ensino"
  	end

  end

end
