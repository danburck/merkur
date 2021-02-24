class RemoveStarshipFromTrips < ActiveRecord::Migration[6.0]
  def change
  	remove_column :trips, :starship
  end
end
