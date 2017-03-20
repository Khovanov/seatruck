class PositionSerializer < ActiveModel::Serializer
  attributes :id, :open_date
  belongs_to :port
  belongs_to :vessel
end
