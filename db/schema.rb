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

ActiveRecord::Schema.define(version: 20220224093900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_lines", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "menu_id"
    t.integer  "tax_percent"
    t.integer  "tax_cents",        default: 0, null: false
    t.integer  "net_amount_cents", default: 0, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "price_cents",      default: 0, null: false
    t.integer  "quantity"
    t.index ["bill_id"], name: "index_bill_lines_on_bill_id", using: :btree
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "order_summary_id"
    t.string   "bill_status"
    t.datetime "date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "tax_total_cents",        default: 0, null: false
    t.string   "payment_mode"
    t.integer  "price_total_cents",      default: 0, null: false
    t.integer  "net_amount_total_cents", default: 0, null: false
    t.index ["order_summary_id"], name: "index_bills_on_order_summary_id", using: :btree
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_cart_items_on_menu_id", using: :btree
    t.index ["user_id"], name: "index_cart_items_on_user_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.string   "password"
    t.string   "address"
    t.integer  "pincode"
    t.string   "gender"
    t.string   "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "sort_order", default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "tax_id"
    t.index ["parent_id"], name: "index_menu_categories_on_parent_id", using: :btree
    t.index ["tax_id"], name: "index_menu_categories_on_tax_id", using: :btree
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "menu_category_id"
    t.integer  "menu_choice"
    t.text     "description"
    t.integer  "stock"
    t.string   "display"
    t.integer  "sort_order",       default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "price_cents",      default: 0, null: false
    t.integer  "tax_cents",        default: 0, null: false
    t.integer  "net_amount_cents", default: 0, null: false
    t.index ["menu_category_id"], name: "index_menus_on_menu_category_id", using: :btree
  end

  create_table "order_lines", force: :cascade do |t|
    t.integer  "order_summary_id"
    t.integer  "quantity"
    t.integer  "menu_id"
    t.integer  "tax_id"
    t.float    "item_total"
    t.datetime "date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["menu_id"], name: "index_order_lines_on_menu_id", using: :btree
    t.index ["order_summary_id"], name: "index_order_lines_on_order_summary_id", using: :btree
    t.index ["tax_id"], name: "index_order_lines_on_tax_id", using: :btree
  end

  create_table "order_summaries", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "order_id"
    t.string   "order_address"
    t.string   "order_status"
    t.text     "order_remark"
    t.integer  "order_total"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "payment_mode"
    t.index ["user_id"], name: "index_order_summaries_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "order_summary_id"
    t.string   "payment_mode"
    t.integer  "payment_id"
    t.string   "payment_status"
    t.datetime "date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.jsonb    "response",         default: {}
    t.integer  "bill_id"
    t.index ["bill_id"], name: "index_payments_on_bill_id", using: :btree
    t.index ["order_summary_id"], name: "index_payments_on_order_summary_id", using: :btree
  end

  create_table "pincodes", force: :cascade do |t|
    t.string   "pincode"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tax_lines", force: :cascade do |t|
    t.integer  "tax_id"
    t.integer  "bill_id"
    t.integer  "tax_percent"
    t.float    "cgst_percent"
    t.float    "sgst_percent"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["bill_id"], name: "index_tax_lines_on_bill_id", using: :btree
    t.index ["tax_id"], name: "index_tax_lines_on_tax_id", using: :btree
  end

  create_table "taxes", force: :cascade do |t|
    t.integer  "gst"
    t.float    "sgst"
    t.float    "cgst"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address_type"
    t.string   "address"
    t.string   "pincode"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "contact"
    t.string   "role"
    t.string   "dob"
    t.string   "address"
    t.string   "pincode"
    t.jsonb    "cart_array",             default: {}
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "menu_categories", "menu_categories", column: "parent_id"
end
