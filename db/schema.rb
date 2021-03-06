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

ActiveRecord::Schema.define(version: 20140812234903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "title",         default: ""
    t.text     "description",   default: ""
    t.integer  "hour_capacity", default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

  create_table "project_assignments", force: true do |t|
    t.integer  "person_id"
    t.integer  "project_id"
    t.string   "summary",    default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_assignments", ["person_id"], name: "index_project_assignments_on_person_id", using: :btree
  add_index "project_assignments", ["project_id"], name: "index_project_assignments_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description",    default: ""
    t.integer  "duration_weeks", default: 0
    t.datetime "start_date"
    t.string   "client",         default: ""
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weekly_project_assignments", force: true do |t|
    t.integer  "project_assignment_id"
    t.date     "week_start"
    t.integer  "days_working"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weekly_project_assignments", ["project_assignment_id"], name: "index_weekly_project_assignments_on_project_assignment_id", using: :btree

end
