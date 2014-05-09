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

ActiveRecord::Schema.define(version: 20140508160122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dress_rentals", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "borrower_id", null: false
    t.integer  "dress_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dress_rentals", ["borrower_id"], name: "index_dress_rentals_on_borrower_id", using: :btree
  add_index "dress_rentals", ["dress_id"], name: "index_dress_rentals_on_dress_id", using: :btree

  create_table "dresses", force: true do |t|
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "name",               limit: 20,                 null: false
    t.string   "size",                                          null: false
    t.text     "description"
    t.decimal  "price",                                         null: false
    t.boolean  "available",                     default: true
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "published",                     default: false
  end

  add_index "dresses", ["user_id"], name: "index_dresses_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "email",                                          null: false
    t.string   "name",               limit: 20,                  null: false
    t.string   "encrypted_password", limit: 128,                 null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,                 null: false
    t.boolean  "admin",                          default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
