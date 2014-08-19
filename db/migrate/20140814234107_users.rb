class Users < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :digest, :password_digest
    end
  end
end
