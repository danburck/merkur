class AddFirstNameToTravellers < ActiveRecord::Migration[6.0]
  def change
     add_column :travellers, :first_name, :string
  end
end
