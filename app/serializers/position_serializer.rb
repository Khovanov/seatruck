class PositionSerializer < ActiveModel::Serializer
  attributes :id, :open_date
  has_one :vessel
  has_one :port
end
