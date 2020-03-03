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

ActiveRecord::Schema.define(version: 2020_03_03_143642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.integer "numbers", null: false, array: true
    t.integer "stars", null: false, array: true
    t.boolean "milhao", default: false
    t.integer "number_of_weeks", default: 1
    t.boolean "auto_renew", default: false
    t.string "status", null: false, array: true
    t.bigint "user_id"
    t.bigint "group_id"
    t.bigint "draw_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["draw_id"], name: "index_bets_on_draw_id"
    t.index ["group_id"], name: "index_bets_on_group_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "draws", force: :cascade do |t|
    t.integer "numbers"
    t.integer "stars"
    t.date "draw_date", null: false
    t.jsonb "prizes"
    t.date "closing_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "public", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.bigint "user_id"
    t.date "date_of_birth"
    t.string "nif"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bets", "draws"
  add_foreign_key "bets", "groups"
  add_foreign_key "bets", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "profiles", "users"
end
