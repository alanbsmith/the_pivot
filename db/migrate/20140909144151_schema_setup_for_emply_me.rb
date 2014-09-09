class SchemaSetupForEmplyMe < ActiveRecord::Migration
  def change

    drop_table "cart_items"

    create_table "listings", force: true do |t|
      t.text     "title"
      t.text     "description"
      t.text     "pay_rate"
      t.text     "job_type"
      t.integer  "positions"
      t.datetime "closing"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "users", force: true do |t|
      t.string   "first_name"
      t.string   "last_name"
      t.string   "email"
      t.string   "password_digest"
      t.string   "salt"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "remember_token"
      t.string   "role"
    end

    create_table "categories", force: true do |t|
      t.text     "title"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

  end
end
