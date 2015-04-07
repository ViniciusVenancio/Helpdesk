class AddContractTypeIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :contract_type_id, :integer
  end
end
