class ChangeDataTypeForStatus < ActiveRecord::Migration
  def up
    change_column :items, :status, :integer
  end

  def down
    change_column :items, :status, :string
  end
end
