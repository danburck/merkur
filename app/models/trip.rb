class Trip < ApplicationRecord
  belongs_to :body
  belongs_to :traveller
end
