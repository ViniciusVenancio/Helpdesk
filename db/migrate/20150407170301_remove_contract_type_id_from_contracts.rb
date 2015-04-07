class RemoveContractTypeIdFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :contract_type_id, :integer
  end
end
