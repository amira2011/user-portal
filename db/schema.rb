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

ActiveRecord::Schema[7.0].define(version: 2024_02_17_132443) do
  create_table "lead_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "lead_id", null: false
    t.boolean "home_garage"
    t.boolean "home_owner"
    t.integer "home_length"
    t.boolean "interested_in_home_insurance"
    t.boolean "interested_in_condo_insurance"
    t.boolean "interested_in_life_insurance"
    t.boolean "interested_in_renters_insurance"
    t.boolean "interested_in_usage_based_policy"
    t.boolean "currently_insured"
    t.string "current_company"
    t.integer "current_customer"
    t.integer "continuous_coverage"
    t.date "current_policy_expiration_date"
    t.boolean "military_affiliation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_company"], name: "index_lead_details_on_current_company"
    t.index ["lead_id"], name: "index_lead_details_on_lead_id"
  end

  create_table "leads", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "lead_details", "leads"
  add_foreign_key "leads", "users"
end
