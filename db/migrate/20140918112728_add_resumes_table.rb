class AddResumesTable < ActiveRecord::Migration
  def change

    create_table "resumes", force: true do |t|
      t.integer  "user_id"
      t.integer  "cart_listing_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "document_file_name"
      t.string   "document_content_type"
      t.integer  "document_file_size"
      t.datetime "document_updated_at"
    end
  end

end
