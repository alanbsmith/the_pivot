class AddStatusDefaultToOrder < ActiveRecord::Migration
  def change
    change_column :orders, :status, :string, :default => 'open'
  end
end
