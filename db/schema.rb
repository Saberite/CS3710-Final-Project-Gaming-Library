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

ActiveRecord::Schema[7.1].define(version: 2024_11_30_213420) do
  create_table "gamers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "favorite_genere"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.index ["email"], name: "index_gamers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_gamers_on_reset_password_token", unique: true
  end

  create_table "libraries", force: :cascade do |t|
    t.string "game_name"
    t.string "game_desc"
    t.integer "gamer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false, null: false
    t.index ["gamer_id"], name: "index_libraries_on_gamer_id"
  end

  add_foreign_key "libraries", "gamers"
end
