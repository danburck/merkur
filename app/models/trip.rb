class Trip < ApplicationRecord
  belongs_to :body
  belongs_to :user

  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :starship, presence: true
  validates :travel_cost, presence: true
  validates :starship, presence: true
end
