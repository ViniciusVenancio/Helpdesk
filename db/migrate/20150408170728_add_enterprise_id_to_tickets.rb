class AddEnterpriseIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :enterprise_id, :integer
  end
end
