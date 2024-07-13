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

ActiveRecord::Schema.define(version: 2024_07_09_200756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "time_block_id", null: false
    t.date "date"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_block_id"], name: "index_assignments_on_time_block_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "service_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daily_contracts", force: :cascade do |t|
    t.integer "day"
    t.time "start_time"
    t.time "end_time"
    t.bigint "contract_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contract_id"], name: "index_daily_contracts_on_contract_id"
  end

  create_table "time_blocks", force: :cascade do |t|
    t.time "hour"
    t.bigint "daily_contract_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_contract_id"], name: "index_time_blocks_on_daily_contract_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "color"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "assignments", "time_blocks"
  add_foreign_key "assignments", "users"
  add_foreign_key "time_blocks", "daily_contracts"
end
