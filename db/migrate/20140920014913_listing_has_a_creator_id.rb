class ListingHasACreatorId < ActiveRecord::Migration
  def change
    add_column :listings, :creator_id, :integer
  end
end
