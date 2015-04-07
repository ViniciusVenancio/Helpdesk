class AddContractIdToContractTypes < ActiveRecord::Migration
  def change
    add_column :contract_types, :contract_id, :integer
  end
end
