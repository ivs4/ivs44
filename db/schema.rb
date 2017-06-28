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

ActiveRecord::Schema.define(version: 20170618142301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barrels", force: :cascade do |t|
    t.string   "location",            null: false
    t.date     "date_of_manufacture", null: false
    t.float    "amount",              null: false
    t.string   "is_empty",            null: false
    t.date     "date_of_filling",     null: false
    t.integer  "varietywine_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "barrels", ["varietywine_id"], name: "index_barrels_on_varietywine_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grapesorts", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "place_of_production", null: false
    t.date     "date_of_collection",  null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 30, null: false
    t.date     "start_date",             null: false
    t.date     "finish_date",            null: false
    t.float    "price",                  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "projects", ["name", "start_date", "finish_date"], name: "index_projects_on_name_and_start_date_and_finish_date", unique: true, using: :btree

  create_table "relationships", force: :cascade do |t|
    t.string   "ratio",          null: false
    t.integer  "grapesort_id",   null: false
    t.integer  "varietywine_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "relationships", ["grapesort_id"], name: "index_relationships_on_grapesort_id", using: :btree
  add_index "relationships", ["varietywine_id"], name: "index_relationships_on_varietywine_id", using: :btree

  create_table "role_users", force: :cascade do |t|
    t.integer  "role_id",    null: false
    t.integer  "user_id",    null: false
    t.json     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_users", ["role_id"], name: "index_role_users_on_role_id", using: :btree
  add_index "role_users", ["user_id"], name: "index_role_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "info",       null: false
    t.text     "full_info",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["info"], name: "index_roles_on_info", unique: true, using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.date     "birthday"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  create_table "varietywines", force: :cascade do |t|
    t.string   "name",             null: false
    t.string   "type_of_wine",     null: false
    t.string   "color",            null: false
    t.integer  "aging_in_barrels", null: false
    t.integer  "aging_in_bottles", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "worker_projects", force: :cascade do |t|
    t.integer  "worker_id",  null: false
    t.integer  "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "worker_projects", ["project_id"], name: "index_worker_projects_on_project_id", using: :btree
  add_index "worker_projects", ["worker_id", "project_id"], name: "index_worker_projects_on_worker_id_and_project_id", unique: true, using: :btree
  add_index "worker_projects", ["worker_id"], name: "index_worker_projects_on_worker_id", using: :btree

  create_table "workers", force: :cascade do |t|
    t.string   "ln",            limit: 20, null: false
    t.string   "fn",            limit: 20, null: false
    t.string   "sn",            limit: 20
    t.string   "pas_number",               null: false
    t.string   "pas_serial",               null: false
    t.string   "inn",                      null: false
    t.date     "birthday",                 null: false
    t.string   "post",          limit: 30, null: false
    t.integer  "department_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "workers", ["department_id"], name: "index_workers_on_department_id", using: :btree
  add_index "workers", ["inn"], name: "index_workers_on_inn", unique: true, using: :btree
  add_index "workers", ["pas_number"], name: "index_workers_on_pas_number", unique: true, using: :btree
  add_index "workers", ["pas_serial"], name: "index_workers_on_pas_serial", unique: true, using: :btree

  add_foreign_key "barrels", "varietywines"
  add_foreign_key "relationships", "grapesorts"
  add_foreign_key "relationships", "varietywines"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "worker_projects", "projects"
  add_foreign_key "worker_projects", "workers"
  add_foreign_key "workers", "departments"
end
