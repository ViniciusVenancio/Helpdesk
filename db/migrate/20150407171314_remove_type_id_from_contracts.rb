class RemoveTypeIdFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :type_id, :integer
  end
end
