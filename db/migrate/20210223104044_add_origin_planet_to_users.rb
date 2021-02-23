class AddOriginPlanetToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :origin_planet, :string
  end
end
