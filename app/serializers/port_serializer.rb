class PortSerializer < ActiveModel::Serializer
  attributes :id, :title, :lat, :lng
end
