class Position < ActiveRecord::Base
  belongs_to :vessel
  belongs_to :port
  validates :vessel_id, :port_id, :open_date, presence: true
  default_scope -> { order(open_date: :asc) }
end
