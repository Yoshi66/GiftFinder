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

ActiveRecord::Schema.define(version: 20150118002625) do

  create_table "comments", force: true do |t|
    t.string   "post"
    t.string   "url"
    t.string   "question"
    t.integer  "demand_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demands", force: true do |t|
    t.string   "country"
    t.string   "gender"
    t.integer  "age"
    t.integer  "price"
    t.string   "purpose"
    t.string   "category"
    t.text     "describe"
    t.text     "other"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medals", force: true do |t|
    t.integer  "gold",       default: 0
    t.integer  "silver",     default: 0
    t.integer  "bronze",     default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "user_type"
    t.string   "webpage"
    t.string   "product_type"
    t.text     "description"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
