class Vessel < ActiveRecord::Base
  has_many :positions, dependent: :destroy
  validates :title, :hold_capacity, presence: true
end
