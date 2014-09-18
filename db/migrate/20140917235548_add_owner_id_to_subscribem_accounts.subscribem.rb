# This migration comes from subscribem (originally 20140914052933)
class AddOwnerIdToSubscribemAccounts < ActiveRecord::Migration
  def change
    add_column :subscribem_accounts, :owner_id, :integer
  end
end
