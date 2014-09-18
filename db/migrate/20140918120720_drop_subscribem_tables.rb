class DropSubscribemTables < ActiveRecord::Migration
  def down
    drop_table :subscribem_accounts
    drop_table :subscribem_members
    drop_table :subscribem_users
  end
end
