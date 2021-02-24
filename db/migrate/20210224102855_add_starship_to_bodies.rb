class AddStarshipToBodies < ActiveRecord::Migration[6.0]
  def change
  	add_reference :bodies, :starship, foreign_key: true
  end
end
