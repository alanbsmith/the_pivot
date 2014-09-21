class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.integer :user_id
      t.string :subdomain
      t.string :name

      t.timestamps
    end
  end
end
