class Starship < ApplicationRecord
	has_many :bodies
	validates :name, :cost, presence: true
	validates :name, uniqueness: true
	validates :cost, :numericality => { :greater_than_or_equal_to => 1 }
end
