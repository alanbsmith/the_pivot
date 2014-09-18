class DropSubscribeTables < ActiveRecord::Migration
  def change
    drop_table :subscribem_accounts
    drop_table :subscribem_members
    drop_table :subscribem_users
  end
end
