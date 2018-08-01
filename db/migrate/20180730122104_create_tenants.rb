class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :full_name
      t.string :token
      t.integer :requests_amount, default: 0

      t.timestamps
    end
  end
end
