class RemoveLatLongCar < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :lat
    remove_column :cars, :long
    add_column :cars, :address, :string, null: false
  end
end
