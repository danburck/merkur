class Body < ApplicationRecord
	include PgSearch::Model
		pg_search_scope :search_by_name,
    	against: [ :name ],
    	using: {
     		tsearch: { prefix: true }
     	}

    pg_search_scope :search_by_nearest_planet,
      against: [ :nearest_planet ],
      using: {
        tsearch: { prefix: true }
      }

	has_many :trips
	belongs_to :starship
	validates :name, :nearest_planet, :distance, :climate, :capacity, :cost_per_day, presence: true
	validates :is_planet, inclusion: [true, false]
	validates :capacity, :cost_per_day, :numericality => { :greater_than_or_equal_to => 1 }
	validates :distance, :numericality => { :greater_than_or_equal_to => 0.0 }
	validates :name, uniqueness: true
end
