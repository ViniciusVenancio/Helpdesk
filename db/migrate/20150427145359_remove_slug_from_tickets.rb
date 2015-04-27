class RemoveSlugFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :slug, :string
  end
end
