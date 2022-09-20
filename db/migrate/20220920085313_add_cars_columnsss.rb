class AddCarsColumnsss < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :title, :string, null: false
    add_column :cars, :lat, :float, null: false
    add_column :cars, :long, :float, null: false
    add_column :cars, :description, :text, null: false
    add_column :cars, :car_type, :string, null: false
    add_column :cars, :price_per_day, :integer, null: false
  end
end
