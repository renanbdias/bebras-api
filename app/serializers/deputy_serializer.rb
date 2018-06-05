class DeputySerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :school
end