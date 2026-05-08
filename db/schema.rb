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

ActiveRecord::Schema[8.1].define(version: 2025_11_28_033954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "modality"
    t.string "name"
    t.bigint "tournament_id", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_categories_on_tournament_id"
  end

  create_table "competitors", force: :cascade do |t|
    t.integer "age"
    t.string "belt"
    t.datetime "created_at", null: false
    t.string "dojo"
    t.string "first_name"
    t.string "last_name"
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "competitor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_enrollments_on_category_id"
    t.index ["competitor_id"], name: "index_enrollments_on_competitor_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "competitor1_id", null: false
    t.bigint "competitor2_id", null: false
    t.datetime "created_at", null: false
    t.jsonb "score_data"
    t.datetime "updated_at", null: false
    t.bigint "winner_id"
    t.index ["category_id"], name: "index_matches_on_category_id"
    t.index ["competitor1_id"], name: "index_matches_on_competitor1_id"
    t.index ["competitor2_id"], name: "index_matches_on_competitor2_id"
    t.index ["winner_id"], name: "index_matches_on_winner_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.string "location"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "tournaments"
  add_foreign_key "enrollments", "categories"
  add_foreign_key "enrollments", "competitors"
  add_foreign_key "matches", "categories"
  add_foreign_key "matches", "competitors", column: "competitor1_id"
  add_foreign_key "matches", "competitors", column: "competitor2_id"
  add_foreign_key "matches", "competitors", column: "winner_id"
end
