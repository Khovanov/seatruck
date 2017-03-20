class Cargo < ActiveRecord::Base
  belongs_to :port
  validates :title, :port_id, :open_date, :capacity, presence: true
  default_scope -> { order(open_date: :asc) }
end
