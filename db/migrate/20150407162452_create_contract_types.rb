class CreateContractTypes < ActiveRecord::Migration
  def change
    create_table :contract_types do |t|
      t.string :name
      t.string :description
      t.float :value
      t.string :value_type

      t.timestamps
    end
  end
end
