class ReworkSchemaForPostgres < ActiveRecord::Migration
  def change
    create_table "cart_items", force: true do |t|
      t.integer  "item_id"
      t.integer  "cart_id"
      t.integer  "quantity",   default: 1
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "order_id"
    end

    add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
    add_index "cart_items", ["item_id", "cart_id"], name: "index_cart_items_on_item_id_and_cart_id", unique: true, using: :btree
    add_index "cart_items", ["item_id"], name: "index_cart_items_on_item_id", using: :btree
    add_index "cart_items", ["order_id"], name: "index_cart_items_on_order_id", using: :btree

    create_table "carts", force: true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "categories", force: true do |t|
      t.text     "title"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "description"
      t.string   "image"
    end

    create_table "categorizations", force: true do |t|
      t.integer  "category_id"
      t.integer  "item_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
    add_index "categorizations", ["item_id"], name: "index_categorizations_on_item_id", using: :btree

    create_table "items", force: true do |t|
      t.text     "title"
      t.text     "description"
      t.decimal  "price",       precision: 10, scale: 2
      t.text     "image"
      t.integer  "status"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "orders", force: true do |t|
      t.integer  "user_id"
      t.string   "status",     default: "open"
      t.integer  "total"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "receiving"
    end

    create_table "users", force: true do |t|
      t.string   "first_name"
      t.string   "last_name"
      t.string   "email"
      t.string   "username"
      t.string   "password_digest"
      t.string   "salt"
      t.integer  "address_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "type"
      t.string   "remember_token"
      t.string   "role",            default: "default"
      t.string   "street"
      t.string   "city"
      t.string   "state"
      t.string   "zipcode"
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
    add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  end
end
