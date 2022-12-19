# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_18_183912) do
  create_table "lists", force: :cascade do |t|
    t.string "spisok"
    t.integer "stud_id", null: false
    t.integer "predmet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["predmet_id"], name: "index_lists_on_predmet_id"
    t.index ["stud_id"], name: "index_lists_on_stud_id"
  end

  create_table "predmets", force: :cascade do |t|
    t.string "name"
    t.integer "teach_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "homework"
    t.index ["teach_id"], name: "index_predmets_on_teach_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "time"
    t.integer "day"
    t.integer "predmet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["predmet_id"], name: "index_schedules_on_predmet_id"
  end

  create_table "studs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_studs_on_user_id"
  end

  create_table "teaches", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teaches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "lists", "predmets"
  add_foreign_key "lists", "studs"
  add_foreign_key "predmets", "teaches"
  add_foreign_key "schedules", "predmets"
  add_foreign_key "studs", "users"
  add_foreign_key "teaches", "users"
end
