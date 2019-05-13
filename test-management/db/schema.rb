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

ActiveRecord::Schema.define(version: 2019_05_13_054524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "department_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "phone_number"
    t.bigint "department_id"
    t.boolean "terms_of_service", default: false
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["phone_number"], name: "index_users_on_phone_number"
  end

  add_foreign_key "users", "departments"
end
