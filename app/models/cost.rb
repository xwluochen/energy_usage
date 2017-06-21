class Cost < ApplicationRecord
  belongs_to :measurement
  belongs_to :address


  validates :year, :month, :month_cost, :measurement_id, :address_id, presence: true
end