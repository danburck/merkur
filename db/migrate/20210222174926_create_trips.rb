class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.references :body, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :arrival_date
      t.date :departure_date
      t.string :starship
      t.float :travel_cost

      t.timestamps
    end
  end
end
