class AddOriginPlanetToTravellers < ActiveRecord::Migration[6.0]
  def change
    add_column :travellers, :origin_planet, :string
  end
end
