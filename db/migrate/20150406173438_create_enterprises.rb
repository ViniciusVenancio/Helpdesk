class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :password
      t.string :corporate_name
      t.string :phone
      t.string :cnpj
      t.string :state_registration
      t.string :adress
      t.integer :number
      t.string :district
      t.string :city
      t.string :cep
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
