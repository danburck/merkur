class RemoveTravellerFromTrips < ActiveRecord::Migration[6.0]
  def change
    remove_reference :trips, :traveller, null: false, foreign_key: true
  end
end
