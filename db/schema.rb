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

ActiveRecord::Schema.define(version: 20150331205450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_entries", force: :cascade do |t|
    t.integer  "budget_payee_id"
    t.integer  "budget_subcategory_id"
    t.decimal  "price",                 precision: 12, scale: 2
    t.string   "notes"
    t.date     "entry_date"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "budget_entries", ["budget_payee_id"], name: "index_budget_entries_on_budget_payee_id", using: :btree
  add_index "budget_entries", ["budget_subcategory_id"], name: "index_budget_entries_on_budget_subcategory_id", using: :btree

  create_table "budget_events", force: :cascade do |t|
    t.integer  "budget_payee_id"
    t.date     "event_date"
    t.decimal  "price",              precision: 12, scale: 2
    t.boolean  "recurring"
    t.integer  "recurring_interval"
    t.string   "event_action"
    t.string   "url"
    t.date     "alert_date"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "budget_events", ["budget_payee_id"], name: "index_budget_events_on_budget_payee_id", using: :btree

  create_table "budget_payees", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_subcategories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "budget_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "budget_subcategories", ["budget_category_id"], name: "index_budget_subcategories_on_budget_category_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "health_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "health_categories", ["slug"], name: "index_health_categories_on_slug", unique: true, using: :btree

  create_table "health_entries", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "entry_date"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "health_entries", ["user_id"], name: "index_health_entries_on_user_id", using: :btree

  create_table "health_meals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "time"
    t.integer  "meal_category",                          default: 0
    t.integer  "calories"
    t.integer  "quality"
    t.integer  "healthiness"
    t.boolean  "home"
    t.boolean  "vegetarian"
    t.decimal  "cost",          precision: 12, scale: 2
    t.string   "notes"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "health_meals", ["user_id"], name: "index_health_meals_on_user_id", using: :btree

  create_table "health_ratings", force: :cascade do |t|
    t.integer  "health_category_id"
    t.integer  "health_entry_id"
    t.integer  "value"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "health_ratings", ["health_category_id"], name: "index_health_ratings_on_health_category_id", using: :btree
  add_index "health_ratings", ["health_entry_id"], name: "index_health_ratings_on_health_entry_id", using: :btree

  create_table "health_workout_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "health_workout_categories", ["slug"], name: "index_health_workout_categories_on_slug", unique: true, using: :btree

  create_table "health_workouts", force: :cascade do |t|
    t.integer  "health_workout_category_id"
    t.integer  "user_id"
    t.datetime "start"
    t.float    "duration"
    t.float    "distance"
    t.integer  "rating"
    t.string   "notes"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "health_workouts", ["health_workout_category_id"], name: "index_health_workouts_on_health_workout_category_id", using: :btree
  add_index "health_workouts", ["user_id"], name: "index_health_workouts_on_user_id", using: :btree

  create_table "notes_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes_entries", force: :cascade do |t|
    t.string   "name"
    t.string   "slug",              null: false
    t.string   "body"
    t.integer  "notes_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "notes_entries", ["notes_category_id"], name: "index_notes_entries_on_notes_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "budget_entries", "budget_payees"
  add_foreign_key "budget_entries", "budget_subcategories"
  add_foreign_key "budget_events", "budget_payees"
  add_foreign_key "budget_subcategories", "budget_categories"
  add_foreign_key "health_entries", "users"
  add_foreign_key "health_meals", "users"
  add_foreign_key "health_ratings", "health_categories"
  add_foreign_key "health_ratings", "health_entries"
  add_foreign_key "health_workouts", "health_workout_categories"
  add_foreign_key "health_workouts", "users"
  add_foreign_key "notes_entries", "notes_categories"
end
