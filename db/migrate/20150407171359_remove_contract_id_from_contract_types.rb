class RemoveContractIdFromContractTypes < ActiveRecord::Migration
  def change
    remove_column :contract_types, :contract_id, :integer
  end
end
