class Body < ApplicationRecord
	validates :name, :nearest_planet, :distance, :climate, :discovery_date, :discovered_by, :is_planet, :gravity, :capacity, :cost_per_day, presence: true
	validates :capacity, :cost_per_day, :numericality => { :greater_than_or_equal_to => 1 }
end
