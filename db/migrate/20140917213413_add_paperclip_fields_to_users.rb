class AddPaperclipFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pdf_name,      :string
    add_column :users, :pdf_type,      :string
    add_column :users, :pdf_size,      :integer
    add_column :users, :pdf_update_at, :datetime
  end
end
