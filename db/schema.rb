# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_27_123500) do

  create_table "disbursements", force: :cascade do |t|
    t.integer "merchant_id", null: false
    t.decimal "amount", default: "0.0", null: false
    t.integer "week", null: false
    t.integer "year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchant_id", "year", "week"], name: "index_disbursements_on_merchant_id_and_year_and_week", unique: true
    t.index ["merchant_id"], name: "index_disbursements_on_merchant_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "cif", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cif"], name: "index_merchants_on_cif", unique: true
    t.index ["email"], name: "index_merchants_on_email", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.integer "merchant_id", null: false
    t.integer "shopper_id"
    t.decimal "amount", null: false
    t.datetime "completed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "disbursement_id"
    t.index ["disbursement_id"], name: "index_orders_on_disbursement_id"
    t.index ["merchant_id"], name: "index_orders_on_merchant_id"
    t.index ["shopper_id"], name: "index_orders_on_shopper_id"
  end

  create_table "shoppers", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "nif", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_shoppers_on_email", unique: true
    t.index ["nif"], name: "index_shoppers_on_nif", unique: true
  end

  add_foreign_key "disbursements", "merchants"
  add_foreign_key "orders", "merchants"
end
