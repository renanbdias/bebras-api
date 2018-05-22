class Deputy < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :challenges, inverse_of: :deputy
  belongs_to :school, inverse_of: :deputies

  validates :name, :email, :phone, presence: true

end
