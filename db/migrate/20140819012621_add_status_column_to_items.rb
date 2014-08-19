class AddStatusColumnToItems < ActiveRecord::Migration
   def up
    add_column :items, :status_cd, :integer
  end

  def down
    remove_column :items, :status
  end
end
