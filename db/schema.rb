# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_15_170541) do

  create_table "horoscopes", force: :cascade do |t|
    t.string "sign"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "month_id", null: false
    t.index ["month_id"], name: "index_horoscopes_on_month_id"
  end

  create_table "journals", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "mood"
    t.integer "user_id"
    t.integer "horoscope_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["horoscope_id"], name: "index_journals_on_horoscope_id"
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "months", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "horoscopes", "months"
  add_foreign_key "journals", "horoscopes"
  add_foreign_key "journals", "users"
end
