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

ActiveRecord::Schema.define(version: 2019_05_22_102448) do

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
    t.boolean "is_parent", default: false
    t.bigint "sla_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
    t.index ["sla_id"], name: "index_categories_on_sla_id"
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
    t.string "number"
    t.string "slug"
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.integer "status"
    t.datetime "pending"
    t.bigint "group_id", default: 1
    t.bigint "category_id", default: 1
    t.string "attachment"
    t.text "comment"
    t.integer "step", default: 1
    t.integer "creator_id"
    t.integer "modifier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_incidents_on_category_id"
    t.index ["group_id"], name: "index_incidents_on_group_id"
    t.index ["slug"], name: "index_incidents_on_slug", unique: true
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "slas", force: :cascade do |t|
    t.string "sla_type"
    t.datetime "sla_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "email", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.text "tokens"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.datetime "birth_date"
    t.integer "role", default: 0
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "slas"
  add_foreign_key "contractors", "addresses"
  add_foreign_key "group_squads", "groups"
  add_foreign_key "group_squads", "users"
  add_foreign_key "incidents", "categories"
  add_foreign_key "incidents", "groups"
  add_foreign_key "incidents", "users"
end
