class ChangeDistanceToBeFloatInBodies < ActiveRecord::Migration[6.0]
  def change
  	change_column :bodies, :distance, :float
  end
end
