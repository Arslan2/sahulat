# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20210905222454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "phone",      default: "", null: false
    t.string   "service",    default: "", null: false
    t.text     "address",    default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "clusters", force: :cascade do |t|
    t.jsonb    "data",       default: {}, null: false
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "clusters", ["user_id"], name: "index_clusters_on_user_id", using: :btree

  create_table "master_plans", force: :cascade do |t|
    t.string   "name",          default: ""
    t.integer  "percent",       default: 0
    t.date     "plan_date"
    t.boolean  "already_visit", default: false
    t.integer  "uc_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "master_plans", ["uc_id"], name: "index_master_plans_on_uc_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "placeholder"
    t.integer  "question_type"
    t.string   "options",       default: [],                 array: true
    t.boolean  "required",      default: false
    t.boolean  "active",        default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "tehsils", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tehsils", ["user_id"], name: "index_tehsils_on_user_id", using: :btree

  create_table "ucs", force: :cascade do |t|
    t.string   "name",                 default: ""
    t.string   "session_type",         default: "Fixed Station"
    t.date     "last_visit_date"
    t.string   "last_visit_by",        default: ""
    t.boolean  "already_visit",        default: false
    t.integer  "tehsil_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "vaccinator_name",      default: ""
    t.string   "health_facility_name", default: ""
  end

  add_index "ucs", ["tehsil_id"], name: "index_ucs_on_tehsil_id", using: :btree

  create_table "user_identities", force: :cascade do |t|
    t.string   "device_id"
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_identities", ["access_token"], name: "index_user_identities_on_access_token", unique: true, using: :btree
  add_index "user_identities", ["device_id", "user_id"], name: "index_user_identities_on_device_id_and_user_id", unique: true, using: :btree
  add_index "user_identities", ["user_id"], name: "index_user_identities_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "active",                 default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "phone"
    t.string   "role",                   default: "ASV"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
