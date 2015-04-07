class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :contract_type_id

      t.timestamps
    end
  end
end
