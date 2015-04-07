class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :enterprise_id
      t.string :type
      t.date :start_date
      t.date :due_date
      t.float :monthly_payment
      t.integer :sla

      t.timestamps
    end
  end
end
