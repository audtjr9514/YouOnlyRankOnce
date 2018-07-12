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

ActiveRecord::Schema.define(version: 20180505102624) do

  create_table "grades", force: :cascade do |t|
    t.integer  "st_number"
    t.integer  "st_birthday"
    t.integer  "sub_number"
    t.integer  "mid_score" #30
    t.integer  "final_score" #40
    t.integer  "hw" #25
    t.integer  "attend" #15
    t.float    "total"
    t.integer  "student_id"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "grades", ["student_id"], name: "index_grades_on_student_id"
  add_index "grades", ["subject_id"], name: "index_grades_on_subject_id"

  create_table "professors", force: :cascade do |t|
    t.integer  "prof_num"
    t.string   "prof_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stduents", force: :cascade do |t|
    t.integer  "st_number"
    t.integer  "st_birthday"
    t.string   "st_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.integer  "sub_number"
    t.string   "sub_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
