class AddSlugsToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :slug, :string
    add_index :contracts, :slug
  end
end
