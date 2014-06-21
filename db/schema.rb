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

ActiveRecord::Schema.define(version: 20140621161442) do

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
    t.string   "name",        null: false
    t.string   "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
