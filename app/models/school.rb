class School < ApplicationRecord
  has_many :deputies, inverse_of: :school
  has_many :competitors, inverse_of: :school

  validates :name, :phone, :address, :cep, :city, :state, presence: true
end
