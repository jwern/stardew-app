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

ActiveRecord::Schema.define(version: 2022_11_26_192543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "color_choice"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "sale_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "extra_info"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_items_on_game_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "additional_info"
    t.string "info_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.index ["game_id"], name: "index_notes_on_game_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "villager_id"
    t.bigint "item_id"
    t.string "opinion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_preferences_on_item_id"
    t.index ["villager_id"], name: "index_preferences_on_villager_id"
  end

  create_table "villagers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "birth_season"
    t.integer "birth_day"
    t.text "extra_info"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_villagers_on_game_id"
  end

  add_foreign_key "items", "games"
  add_foreign_key "notes", "games"
  add_foreign_key "preferences", "items"
  add_foreign_key "preferences", "villagers"
  add_foreign_key "villagers", "games"
end
