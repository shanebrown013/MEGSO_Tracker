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

ActiveRecord::Schema.define(version: 2022_04_12_031731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnis", force: :cascade do |t|
    t.string "LinkedIn"
    t.integer "alumni_grad_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "highest_position"
    t.string "alumni_name"
  end

  create_table "attendee_lists", force: :cascade do |t|
    t.string "attendee_list_id"
    t.integer "UID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_verifications", force: :cascade do |t|
    t.string "event_verification"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.integer "event_point"
    t.string "event_location"
    t.date "event_date"
    t.time "event_start"
    t.time "event_end"
    t.string "event_verification"
    t.string "event_attendee_list_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "event_description"
  end

  create_table "occupations", force: :cascade do |t|
    t.string "occupation_role"
    t.string "occupation_company"
    t.string "occupation_location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string "reward_name"
    t.integer "reward_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "reward_description"
  end

  create_table "rewards_approval_lists", force: :cascade do |t|
    t.string "reward_name"
    t.integer "UID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rewards_earned_lists", force: :cascade do |t|
    t.string "reward_name"
    t.integer "UID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "UID"
    t.boolean "is_admin"
    t.boolean "is_officer"
    t.string "position"
    t.integer "points"
    t.integer "rewards_earned"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "officer_apply"
  end

end
