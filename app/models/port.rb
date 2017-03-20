class Port < ActiveRecord::Base
  has_many :positions, dependent: :destroy
  has_many :cargos, dependent: :destroy
  validates :title, :lat, :lng, presence: true
end
