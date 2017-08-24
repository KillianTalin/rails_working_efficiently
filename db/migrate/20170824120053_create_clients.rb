class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :siret_num
      t.string :address
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
