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

ActiveRecord::Schema.define(version: 2019_07_29_031359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nominations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "nominee_id"
    t.text "comments"
    t.bigint "survey_id"
    t.index ["nominee_id"], name: "index_nominations_on_nominee_id"
    t.index ["survey_id"], name: "index_nominations_on_survey_id"
    t.index ["user_id"], name: "index_nominations_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "office"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "nominations", "surveys"
  add_foreign_key "nominations", "users"
  add_foreign_key "nominations", "users", column: "nominee_id"
end
