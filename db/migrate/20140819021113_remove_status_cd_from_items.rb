class RemoveStatusCdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :status_cd, :integer
  end
end
