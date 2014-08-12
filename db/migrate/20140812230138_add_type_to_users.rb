class AddTypeToUsers < ActiveRecord::Migration
  def change

    add_column :users, :type, :string
    add_column :orders, :receiving, :string
  end
end
