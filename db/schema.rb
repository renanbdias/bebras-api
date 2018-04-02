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

ActiveRecord::Schema.define(version: 20180402215035) do

  create_table "challenges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "challenge_date"
    t.bigint "deputy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deputy_id"], name: "index_challenges_on_deputy_id"
  end

  create_table "competitors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "challenge_id"
    t.bigint "exam_id"
    t.index ["challenge_id"], name: "index_competitors_on_challenge_id"
    t.index ["email"], name: "index_competitors_on_email", unique: true
    t.index ["exam_id"], name: "index_competitors_on_exam_id"
    t.index ["reset_password_token"], name: "index_competitors_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_competitors_on_uid_and_provider", unique: true
  end

  create_table "deputies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "city"
    t.string "avatar"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_deputies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_deputies_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_deputies_on_uid_and_provider", unique: true
  end

  create_table "exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "competitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competitor_id"], name: "index_exams_on_competitor_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "difficulty"
    t.integer "age_group"
    t.text "explanation"
    t.text "title"
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_questions_on_exam_id"
  end

  add_foreign_key "challenges", "deputies"
  add_foreign_key "competitors", "challenges"
  add_foreign_key "competitors", "exams"
  add_foreign_key "exams", "competitors"
  add_foreign_key "questions", "exams"
end
