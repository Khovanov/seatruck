class CargoSerializer < ActiveModel::Serializer
  attributes :id, :title, :open_date, :capacity
  belongs_to :port
end
