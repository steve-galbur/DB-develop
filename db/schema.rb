# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_28_155948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", id: :serial, force: :cascade do |t|
    t.integer "status_id"
    t.integer "physician_id"
    t.integer "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "email"
  end

  create_table "books", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "year_published"
    t.string "isbn"
    t.decimal "price", precision: 10, scale: 2
    t.boolean "out_of_print"
    t.integer "views"
    t.integer "supplier_id"
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books_orders", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.integer "book_id"
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.integer "visits"
    t.integer "orders_count"
    t.integer "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.time "date_submitted"
    t.integer "status"
    t.decimal "subtotal", precision: 10, scale: 2
    t.decimal "shipping", precision: 10, scale: 2
    t.decimal "tax", precision: 10, scale: 2
    t.decimal "total", precision: 10, scale: 2
    t.integer "customer_id"
  end

  create_table "patients", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physicians", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "rating"
    t.integer "state"
    t.integer "customer_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "physicians"
  add_foreign_key "appointments", "statuses"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "suppliers"
  add_foreign_key "books_orders", "books"
  add_foreign_key "books_orders", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "customers"
end
