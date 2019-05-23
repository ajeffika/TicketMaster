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

ActiveRecord::Schema.define(version: 2019_05_22_102447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "street"
    t.string "street_number"
    t.string "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "incident_id"
    t.integer "sla_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_categories_on_incident_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "contractor_name"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_contractors_on_address_id"
  end

  create_table "group_squads", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_group_squads_on_group_id"
    t.index ["user_id"], name: "index_group_squads_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.integer "status"
    t.datetime "pending"
    t.bigint "group_id"
    t.integer "category_id"
    t.string "attachment"
    t.text "comment"
    t.integer "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_incidents_on_group_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "slas", force: :cascade do |t|
    t.string "sla_type"
    t.datetime "sla_time"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_slas_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "incidents"
  add_foreign_key "contractors", "addresses"
  add_foreign_key "group_squads", "groups"
  add_foreign_key "group_squads", "users"
  add_foreign_key "incidents", "groups"
  add_foreign_key "incidents", "users"
  add_foreign_key "slas", "categories"
end
