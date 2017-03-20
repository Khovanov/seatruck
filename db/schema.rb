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

ActiveRecord::Schema.define(version: 20170320005614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cargos", force: :cascade do |t|
    t.string   "title"
    t.integer  "port_id"
    t.date     "open_date"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cargos", ["port_id"], name: "index_cargos_on_port_id", using: :btree

  create_table "ports", force: :cascade do |t|
    t.string   "title"
    t.decimal  "lat",        precision: 13, scale: 10
    t.decimal  "lng",        precision: 13, scale: 10
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "vessel_id"
    t.integer  "port_id"
    t.date     "open_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["port_id"], name: "index_positions_on_port_id", using: :btree
  add_index "positions", ["vessel_id"], name: "index_positions_on_vessel_id", using: :btree

  create_table "vessels", force: :cascade do |t|
    t.string   "title"
    t.integer  "hold_capacity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "cargos", "ports"
  add_foreign_key "positions", "ports"
  add_foreign_key "positions", "vessels"
end
