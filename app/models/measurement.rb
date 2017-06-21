class Measurement < ApplicationRecord
	validates :usage, presence: true, uniqueness: { case_sensitive: false }
end
