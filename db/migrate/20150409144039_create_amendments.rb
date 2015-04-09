class CreateAmendments < ActiveRecord::Migration
  def change
    create_table :amendments do |t|
      t.integer :contract_id
      t.date :start_date
      t.date :end_date
      t.float :value
      t.integer :number
      t.string :title

      t.timestamps
    end
  end
end
