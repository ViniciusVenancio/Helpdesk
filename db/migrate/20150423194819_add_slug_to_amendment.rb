class AddSlugToAmendment < ActiveRecord::Migration
  def change
    add_column :amendments, :slug, :string
    add_index :amendments, :slug, unique: true
  end
end
