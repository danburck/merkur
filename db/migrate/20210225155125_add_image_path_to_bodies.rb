class AddImagePathToBodies < ActiveRecord::Migration[6.0]
  def change
    add_column :bodies, :image, :string
  end
end
