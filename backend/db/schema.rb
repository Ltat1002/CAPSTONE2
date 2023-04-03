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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_03_21_150513) do
=======
ActiveRecord::Schema[7.0].define(version: 2023_04_01_144031) do
>>>>>>> 9089f07 (add devise for users and active storage for reports)
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

<<<<<<< HEAD
  create_table "districts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.string "codename"
    t.string "division_type"
    t.string "short_codename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

=======
>>>>>>> 9089f07 (add devise for users and active storage for reports)
  create_table "repair_equipments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "eq_type", default: 0
    t.decimal "price", precision: 15, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "report_mobile"
    t.string "report_address"
<<<<<<< HEAD
    t.string "description"
    t.decimal "amount_pay", precision: 15, scale: 4
    t.integer "status", default: 0
    t.bigint "repair_equipment_id", null: false
    t.bigint "ward_id", null: false
=======
    t.string "report_ward"
    t.string "report_district"
    t.string "report_city"
    t.string "description"
    t.decimal "amount_pay", precision: 15, scale: 4
    t.string "reason"
    t.integer "status", default: 0
    t.bigint "repair_equipment_id", null: false
>>>>>>> 9089f07 (add devise for users and active storage for reports)
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repair_equipment_id"], name: "index_reports_on_repair_equipment_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
<<<<<<< HEAD
    t.index ["ward_id"], name: "index_reports_on_ward_id"
=======
>>>>>>> 9089f07 (add devise for users and active storage for reports)
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "rating"
    t.string "comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mobile"
    t.string "address"
<<<<<<< HEAD
    t.string "technique"
    t.integer "role", default: 0
    t.integer "status", default: 0
    t.bigint "ward_id", null: false
=======
    t.string "ward"
    t.string "district"
    t.string "city"
    t.string "technique"
    t.integer "role", default: 0
    t.integer "status", default: 0
>>>>>>> 9089f07 (add devise for users and active storage for reports)
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
<<<<<<< HEAD
    t.index ["ward_id"], name: "index_users_on_ward_id"
  end

  create_table "wards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.string "codename"
    t.string "division_type"
    t.string "short_codename"
    t.bigint "district_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_wards_on_district_id"
=======
  end

  create_table "vouchers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "voucher_code"
    t.decimal "sale", precision: 15, scale: 4
    t.date "using_date"
    t.date "giving_date"
    t.date "expired_date"
    t.bigint "user_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_vouchers_on_report_id"
    t.index ["user_id"], name: "index_vouchers_on_user_id"
>>>>>>> 9089f07 (add devise for users and active storage for reports)
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "reports", "repair_equipments"
  add_foreign_key "reports", "users"
<<<<<<< HEAD
  add_foreign_key "reports", "wards"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "wards"
  add_foreign_key "wards", "districts"
=======
  add_foreign_key "reviews", "users"
  add_foreign_key "vouchers", "reports"
  add_foreign_key "vouchers", "users"
>>>>>>> 9089f07 (add devise for users and active storage for reports)
end
