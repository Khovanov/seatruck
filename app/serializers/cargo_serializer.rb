class CargoSerializer < ActiveModel::Serializer
  attributes :id, :title, :open_date, :capacity
  has_one :port
end
