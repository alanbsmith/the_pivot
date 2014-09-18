# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140918112728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_listings", force: true do |t|
    t.integer  "listing_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "cart_listings", ["cart_id"], name: "index_cart_listings_on_cart_id", using: :btree
  add_index "cart_listings", ["listing_id", "cart_id"], name: "index_cart_listings_on_item_id_and_cart_id", unique: true, using: :btree
  add_index "cart_listings", ["listing_id"], name: "index_cart_listings_on_listing_id", using: :btree
  add_index "cart_listings", ["order_id"], name: "index_cart_listings_on_order_id", using: :btree

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "category_id"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["listing_id"], name: "index_categorizations_on_listing_id", using: :btree

  create_table "listings", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.text     "pay_rate"
    t.text     "employment_type"
    t.integer  "number_of_positions"
    t.integer  "business_id"
    t.datetime "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "pdf_name"
    t.string   "pdf_type"
    t.integer  "pdf_size"
    t.datetime "pdf_update_at"
  end

  add_index "users", ["company_name"], name: "index_users_on_company_name", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
