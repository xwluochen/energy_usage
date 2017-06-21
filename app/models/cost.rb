class Cost < ApplicationRecord
  belongs_to :measurement
  belongs_to :address


  validates :year, :month, :measurement_id, :address_id, presence: true

  validates :month_cost, presence: true, uniqueness: { scope: [:address_id, :measurement_id, :year, :month] }
end