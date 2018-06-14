class Deputy < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :challenges, inverse_of: :deputy
  belongs_to :school, inverse_of: :deputies

  validates :name, :email, :phone, :school, presence: true

  def active_for_authentication?
    super && self.active
  end

  rails_admin do
  	navigation_label "Listar"
  	label "Delegado"
  	label_plural "Delegados"

    field :active do
      label "Confirmado"
    end

  	field :name do
  		label "Nome Completo"
  	end

  	field :email do
  		label "E-mail"
  	end

  	field :phone do
  		label "Telefone"
  	end

  	field :school do
  		label "Instituição de Ensino"
  		help "É a instituição de ensino que está relacionado com o delegado"
  	end

  end

end
