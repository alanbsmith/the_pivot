class ModifyResumesTable < ActiveRecord::Migration
  def change
    create_table "resumes", force: true do |t|
      t.integer  "user_id"
      t.integer  "cart_listing_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "resume"
    end
  end
end
