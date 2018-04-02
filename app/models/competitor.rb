class Competitor < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  belongs_to :challenge, inverse_of: :competitors
end
