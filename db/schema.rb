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

ActiveRecord::Schema[7.0].define(version: 2024_03_02_032333) do
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

  create_table "lead_drivers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "lead_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "relationship"
    t.string "gender"
    t.string "marital_status"
    t.date "birth_date"
    t.integer "first_licensed"
    t.string "education"
    t.string "credit_rating"
    t.boolean "bankruptcy"
    t.string "occupation"
    t.boolean "good_student"
    t.string "license_status"
    t.string "suspended_reason"
    t.string "license_state"
    t.boolean "sr_22"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_rating"], name: "index_lead_drivers_on_credit_rating"
    t.index ["lead_id"], name: "index_lead_drivers_on_lead_id"
    t.index ["relationship"], name: "index_lead_drivers_on_relationship"
  end

  create_table "lead_vehicles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "lead_id", null: false
    t.bigint "lead_driver_id", null: false
    t.string "year"
    t.string "make"
    t.string "model"
    t.string "submodel"
    t.string "vin"
    t.boolean "alarm"
    t.string "primary_purpose"
    t.string "average_mileage"
    t.integer "commute_days_per_week"
    t.string "annual_mileage"
    t.string "ownership"
    t.string "collision"
    t.string "comprehensive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_driver_id"], name: "index_lead_vehicles_on_lead_driver_id"
    t.index ["lead_id"], name: "index_lead_vehicles_on_lead_id"
  end

  create_table "lead_violations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "lead_driver_id", null: false
    t.bigint "lead_id", null: false
    t.string "violation_type"
    t.date "incident_date"
    t.string "description"
    t.string "what_damaged"
    t.boolean "accident_at_fault"
    t.boolean "claim_at_fault"
    t.string "amount_paid"
    t.string "dui_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dui_state"], name: "index_lead_violations_on_dui_state"
    t.index ["lead_driver_id"], name: "index_lead_violations_on_lead_driver_id"
    t.index ["lead_id"], name: "index_lead_violations_on_lead_id"
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
  add_foreign_key "lead_drivers", "leads"
  add_foreign_key "lead_vehicles", "lead_drivers"
  add_foreign_key "lead_vehicles", "leads"
  add_foreign_key "lead_violations", "lead_drivers"
  add_foreign_key "lead_violations", "leads"
  add_foreign_key "leads", "users"
end
