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

ActiveRecord::Schema.define(version: 20140730214430) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "category_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.string   "email"
    t.string   "time_and_date"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.integer  "user_id"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name",              limit: 30
    t.string   "description",       limit: 140
    t.string   "address",           limit: 140
    t.string   "phone",             limit: 12
    t.string   "image"
    t.integer  "user_id"
    t.datetime "weekday_open_at",               default: '2000-01-01 16:00:00'
    t.datetime "weekday_close_at",              default: '2000-01-01 23:59:59'
    t.datetime "friday_open_at",                default: '2000-01-01 16:00:00'
    t.datetime "friday_close_at",               default: '2000-01-01 23:59:59'
    t.datetime "saturday_open_at",              default: '2000-01-01 16:00:00'
    t.datetime "saturday_close_at",             default: '2000-01-01 23:59:59'
    t.datetime "sunday_open_at",                default: '2000-01-01 14:00:00'
    t.datetime "sunday_close_at",               default: '2000-01-01 20:00:00'
    t.integer  "max_reservations"
  end

  create_table "stars", force: true do |t|
    t.datetime "created_at"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "role",                   default: "patron"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
