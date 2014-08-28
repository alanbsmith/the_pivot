class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text    :title
      t.text    :description
      t.integer :price
      t.text    :photo
      t.integer :status

      t.timestamps
    end
  end
end
