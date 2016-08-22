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

ActiveRecord::Schema.define(version: 20160820213017) do

  create_table "journals", force: :cascade do |t|
    t.text     "title"
    t.string   "tags"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
  end

  create_table "note_category_relationships", force: :cascade do |t|
    t.integer "note_id"
    t.integer "category_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "note_type"
    t.text     "title"
    t.text     "content"
    t.text     "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "title"
    t.text     "description"
    t.text     "tags"
    t.datetime "deadline"
    t.datetime "completed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "fullname"
    t.string   "email"
    t.string   "enc_pword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "salt"
  end

end
