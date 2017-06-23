class Address < ApplicationRecord
  validates :location, presence: true, uniqueness: { case_sensitive: false }
end
