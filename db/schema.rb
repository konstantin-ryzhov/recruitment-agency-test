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

ActiveRecord::Schema.define(version: 20140808105657) do

  create_table "employees", force: true do |t|
    t.string  "name"
    t.string  "contacts"
    t.integer "state",    default: 0
    t.decimal "salary"
  end

  create_table "employees_skills", force: true do |t|
    t.integer "employee_id"
    t.integer "skill_id"
  end

  create_table "skills", force: true do |t|
    t.string  "name"
    t.integer "vacancies_count", default: 0
    t.integer "employees_count", default: 0
  end

  add_index "skills", ["name"], name: "index_skills_on_name", unique: true

  create_table "skills_vacancies", force: true do |t|
    t.integer "vacancy_id"
    t.integer "skill_id"
  end

  create_table "vacancies", force: true do |t|
    t.string   "name"
    t.datetime "valid_until"
    t.decimal  "salary"
    t.string   "contacts"
    t.datetime "created_at"
  end

end
