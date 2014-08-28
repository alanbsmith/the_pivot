class ChangingShitToSaveTheWorld < ActiveRecord::Migration
  def change
    change_column :items, :status, :integer, limit: nil
  end
end
