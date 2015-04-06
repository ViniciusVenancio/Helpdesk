class RemovePasswordFromEnterprise < ActiveRecord::Migration
  def change
    remove_column :enterprises, :password, :string
  end
end
