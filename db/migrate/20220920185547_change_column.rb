class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :cars, :street_address, :string
  end
end
