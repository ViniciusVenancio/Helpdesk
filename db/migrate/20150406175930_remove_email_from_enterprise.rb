class RemoveEmailFromEnterprise < ActiveRecord::Migration
  def change
    remove_column :enterprises, :email, :string
  end
end
