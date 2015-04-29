class RemoveSlugFromAmendments < ActiveRecord::Migration
  def change
    remove_column :amendments, :slug, :string
  end
end
