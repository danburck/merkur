class Body < ApplicationRecord
	validates :name, :nearest_planet, :distance, :climate, :capacity, :cost_per_day, presence: true
	validates :is_planet, inclusion: [true, false]
	validates :capacity, :cost_per_day, :numericality => { :greater_than_or_equal_to => 1 }
	validates :name, uniqueness: true
end
