class AddLocationToListings < ActiveRecord::Migration
  def change
    add_column :listings, :location_city,  :string
    add_column :listings, :location_state, :string
  end
end
