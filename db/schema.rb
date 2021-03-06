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

ActiveRecord::Schema.define(version: 20180614195453) do

  create_table "alternatives", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "alternative_symbol"
    t.string "description"
    t.text "html_text"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_alternatives_on_question_id"
  end

  create_table "challenges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "start_date"
    t.bigint "deputy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "actual_start_date"
    t.datetime "end_date"
    t.datetime "actual_end_date"
    t.boolean "did_start", default: false
    t.text "firebase_token"
    t.boolean "did_finish", default: false
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
    t.string "generated_password"
    t.integer "age"
    t.bigint "school_id"
    t.index ["challenge_id"], name: "index_competitors_on_challenge_id"
    t.index ["email"], name: "index_competitors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_competitors_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_competitors_on_school_id"
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
    t.string "avatar"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.boolean "active", default: false
    t.index ["email"], name: "index_deputies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_deputies_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_deputies_on_school_id"
    t.index ["uid", "provider"], name: "index_deputies_on_uid_and_provider", unique: true
  end

  create_table "exam_durations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "exam_duration_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "competitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competitor_id"], name: "index_exams_on_competitor_id"
  end

  create_table "exams_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exam_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "alternative_id"
    t.index ["alternative_id"], name: "index_exams_questions_on_alternative_id"
    t.index ["exam_id"], name: "index_exams_questions_on_exam_id"
    t.index ["question_id"], name: "index_exams_questions_on_question_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "difficulty"
    t.integer "age_group"
    t.text "explanation"
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "html"
    t.integer "right_alternative_id"
    t.index ["right_alternative_id"], name: "index_questions_on_right_alternative_id"
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "cep"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "alternatives", "questions"
  add_foreign_key "challenges", "deputies"
  add_foreign_key "competitors", "challenges"
  add_foreign_key "competitors", "schools"
  add_foreign_key "deputies", "schools"
  add_foreign_key "exams", "competitors"
  add_foreign_key "exams_questions", "alternatives"
  add_foreign_key "exams_questions", "exams"
  add_foreign_key "exams_questions", "questions"
end
