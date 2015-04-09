class AddCurrentValueToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :current_value, :float
  end
end
