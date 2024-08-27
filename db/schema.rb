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

ActiveRecord::Schema[7.2].define(version: 2024_08_27_115846) do
  create_table "interest_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "interest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_interest_users_on_interest_id"
    t.index ["user_id", "interest_id"], name: "index_interest_users_on_user_id_and_interest_id", unique: true
    t.index ["user_id"], name: "index_interest_users_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skill_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_skill_users_on_skill_id"
    t.index ["user_id", "skill_id"], name: "index_skill_users_on_user_id_and_skill_id", unique: true
    t.index ["user_id"], name: "index_skill_users_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "surname"
    t.string "name"
    t.string "patronymic"
    t.string "email"
    t.integer "age"
    t.string "nationality"
    t.string "country"
    t.string "gender"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interest_users", "interests"
  add_foreign_key "interest_users", "users"
  add_foreign_key "skill_users", "skills"
  add_foreign_key "skill_users", "users"
end
