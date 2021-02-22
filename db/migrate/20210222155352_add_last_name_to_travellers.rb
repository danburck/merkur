class AddLastNameToTravellers < ActiveRecord::Migration[6.0]
  def change
    add_column :travellers, :last_name, :string
  end
end
