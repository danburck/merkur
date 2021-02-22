class Traveller < ApplicationRecord
  has_many :trips

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :origin_planet, presence: true
end
