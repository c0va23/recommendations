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

ActiveRecord::Schema.define(version: 20140622202505) do

  create_table "comments", force: true do |t|
    t.text     "message",    null: false
    t.integer  "user_id",    null: false
    t.integer  "thing_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["thing_id"], name: "index_comments_on_thing_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "scores", force: true do |t|
    t.integer  "thing_id",   null: false
    t.integer  "user_id",    null: false
    t.integer  "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["thing_id", "user_id"], name: "index_scores_on_thing_id_and_user_id", unique: true
  add_index "scores", ["thing_id"], name: "index_scores_on_thing_id"
  add_index "scores", ["user_id"], name: "index_scores_on_user_id"

  create_table "tag_of_things", force: true do |t|
    t.integer  "tag_id",     null: false
    t.integer  "thing_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_of_things", ["tag_id", "thing_id"], name: "index_tag_of_things_on_tag_id_and_thing_id", unique: true
  add_index "tag_of_things", ["tag_id"], name: "index_tag_of_things_on_tag_id"
  add_index "tag_of_things", ["thing_id"], name: "index_tag_of_things_on_thing_id"

  create_table "tags", force: true do |t|
    t.string   "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["value"], name: "index_tags_on_value", unique: true

  create_table "things", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  add_index "things", ["name"], name: "index_things_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "name",                        null: false
    t.string   "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",       default: false, null: false
  end

end
