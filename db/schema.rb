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

ActiveRecord::Schema.define(version: 2021_03_08_220818) do

  create_table "abs", force: :cascade do |t|
    t.string "name"
    t.string "intensity"
    t.integer "duration"
  end

  create_table "arms", force: :cascade do |t|
    t.string "name"
    t.string "intensity"
    t.integer "duration"
  end

  create_table "backs", force: :cascade do |t|
    t.string "name"
    t.string "intensity"
    t.integer "duration"
  end

  create_table "legs", force: :cascade do |t|
    t.string "name"
    t.string "intensity"
    t.integer "duration"
  end

  create_table "shoulders", force: :cascade do |t|
    t.string "name"
    t.string "intensity"
    t.integer "duration"
  end

  create_table "users_workouts", force: :cascade do |t|
    t.string "name"
    t.integer "users_id"
    t.integer "worksout_id"
    t.integer "total_duration"
    t.string "favorites"
    t.integer "date"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "abs_id"
    t.integer "arms_id"
    t.integer "legs_id"
    t.integer "shoulders_id"
    t.integer "back_id"
  end

end
