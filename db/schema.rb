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

ActiveRecord::Schema.define(version: 2021_03_06_200435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_statuses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "patronymic"
    t.date "birthdate"
    t.string "city", null: false
    t.string "address"
    t.string "email", null: false
    t.string "phon"
    t.string "skype"
    t.date "entry_date"
    t.integer "lesson_number"
    t.date "communicant_date"
    t.string "comments"
    t.bigint "country_id"
    t.bigint "client_status_id"
    t.bigint "group_id"
    t.bigint "group_position_id"
    t.bigint "team_project_id"
    t.bigint "team_position_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_status_id"], name: "index_clients_on_client_status_id"
    t.index ["country_id"], name: "index_clients_on_country_id"
    t.index ["group_id"], name: "index_clients_on_group_id"
    t.index ["group_position_id"], name: "index_clients_on_group_position_id"
    t.index ["team_position_id"], name: "index_clients_on_team_position_id"
    t.index ["team_project_id"], name: "index_clients_on_team_project_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_positions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_statuses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "email"
    t.string "phon"
    t.string "skype"
    t.date "entry_date"
    t.string "comments"
    t.bigint "country_id", null: false
    t.bigint "group_status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_groups_on_country_id"
    t.index ["group_status_id"], name: "index_groups_on_group_status_id"
  end

  create_table "team_positions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_projects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clients", "client_statuses"
  add_foreign_key "clients", "countries"
  add_foreign_key "clients", "group_positions"
  add_foreign_key "clients", "groups"
  add_foreign_key "clients", "team_positions"
  add_foreign_key "clients", "team_projects"
  add_foreign_key "groups", "countries"
  add_foreign_key "groups", "group_statuses"
  add_foreign_key "users", "clients"
end
