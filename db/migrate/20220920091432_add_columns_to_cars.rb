class AddColumnsToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :mileage, :integer, null: false
    add_column :cars, :fuel_type, :string, null: false
    add_column :cars, :transmission, :string, null: false
    add_column :cars, :year, :integer, null: false
  end
end
