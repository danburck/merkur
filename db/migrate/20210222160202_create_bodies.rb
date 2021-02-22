class CreateBodies < ActiveRecord::Migration[6.0]
  def change
    create_table :bodies do |t|
      t.string :name
      t.string :nearest_planet
      t.integer :distance
      t.integer :capacity
      t.string :climate
      t.date :discovery_date
      t.string :discovered_by
      t.boolean :is_planet
      t.integer :gravity
      t.integer :cost_per_day

      t.timestamps
    end
  end
end
