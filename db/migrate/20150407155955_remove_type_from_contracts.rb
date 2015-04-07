class RemoveTypeFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :type, :string
  end
end
