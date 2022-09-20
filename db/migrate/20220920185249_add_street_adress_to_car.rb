class AddStreetAdressToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :street_address, :float

  end
end
