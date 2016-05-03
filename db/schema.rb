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

ActiveRecord::Schema.define(version: 20160502220729) do

  create_table "customers", force: :cascade do |t|
    t.string   "last_4",        limit: 255
    t.date     "USDA_expdate"
    t.string   "fname",         limit: 255
    t.string   "lname",         limit: 255
    t.string   "MI",            limit: 255
    t.date     "date"
    t.string   "address",       limit: 255
    t.string   "race",          limit: 255
    t.string   "city",          limit: 255
    t.string   "sex",           limit: 255
    t.string   "county",        limit: 255
    t.string   "employer",      limit: 255
    t.string   "state",         limit: 255
    t.string   "zip",           limit: 255
    t.string   "phone_num",     limit: 255
    t.date     "DOB"
    t.string   "occupation",    limit: 255
    t.integer  "age",           limit: 4
    t.string   "last_grade",    limit: 255
    t.float    "salary",        limit: 24
    t.float    "salary_spouse", limit: 24
    t.float    "salary_house",  limit: 24
    t.float    "child_support", limit: 24
    t.string   "food_stamps",   limit: 255
    t.float    "WIC",           limit: 24
    t.float    "unemployment",  limit: 24
    t.float    "social",        limit: 24
    t.float    "ssi",           limit: 24
    t.string   "SSI_note",      limit: 255
    t.string   "other_inc",     limit: 255
    t.string   "other_note",    limit: 255
    t.float    "total_inc",     limit: 24
    t.float    "rent_mortgage", limit: 24
    t.float    "electricity",   limit: 24
    t.float    "gas",           limit: 24
    t.float    "water",         limit: 24
    t.float    "medicine",      limit: 24
    t.float    "med_supplies",  limit: 24
    t.float    "other_exp",     limit: 24
    t.float    "total_exp",     limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "zip_spouse",    limit: 255
  end

  create_table "dependents", force: :cascade do |t|
    t.integer  "customer",     limit: 4
    t.integer  "last_4",       limit: 4
    t.string   "fname",        limit: 255
    t.string   "lname",        limit: 255
    t.string   "food_stamp",   limit: 255
    t.date     "fs_date"
    t.date     "DOB"
    t.integer  "age",          limit: 4
    t.string   "relationship", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "customer_id",  limit: 4
  end

  create_table "donors", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "name",       limit: 255
    t.string   "item_type",  limit: 255
    t.float    "qty",        limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "interviewers", force: :cascade do |t|
    t.string   "fname",      limit: 255
    t.string   "lname",      limit: 255
    t.string   "MI",         limit: 255
    t.integer  "hours",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "total_recipients", limit: 4
    t.integer  "new_clients",      limit: 4
    t.integer  "total_seniors",    limit: 4
    t.integer  "total_adults",     limit: 4
    t.integer  "total_children",   limit: 4
    t.integer  "total_families",   limit: 4
    t.integer  "four",             limit: 4
    t.integer  "five",             limit: 4
    t.integer  "unemployed",       limit: 4
    t.integer  "volunteers",       limit: 4
    t.integer  "vol_hours",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "sign_offs", force: :cascade do |t|
    t.integer  "last_4",     limit: 4
    t.string   "ifname",     limit: 255
    t.string   "ilname",     limit: 255
    t.string   "terms",      limit: 255
    t.string   "notes",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.string   "role",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.decimal  "hours",                     precision: 10, default: 0
    t.integer  "hours_rounded", limit: 4,                  default: 0
    t.integer  "hours_month",   limit: 4,                  default: 0
    t.date     "last_login"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.boolean  "login_status",                             default: true
    t.boolean  "signed_in"
  end

end
