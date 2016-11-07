# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161010061439) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "question_detail_id", limit: 4
    t.text     "correct_option",     limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "question_details", force: :cascade do |t|
    t.integer  "test_id",         limit: 4
    t.string   "question",        limit: 255
    t.integer  "question_number", limit: 4
    t.string   "question_type",   limit: 255
    t.string   "option_1",        limit: 255
    t.string   "option_2",        limit: 255
    t.string   "option_3",        limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "question_details", ["test_id"], name: "index_question_details_on_test_id", using: :btree

  create_table "score_details", id: false, force: :cascade do |t|
    t.integer  "score",      limit: 4
    t.integer  "test_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "score_details", ["test_id"], name: "index_score_details_on_test_id", using: :btree
  add_index "score_details", ["user_id"], name: "index_score_details_on_user_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.integer  "course_id",           limit: 4
    t.string   "name",                limit: 255
    t.integer  "number_of_questions", limit: 4
    t.string   "status",              limit: 255
    t.integer  "time_for_test",       limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "tests", ["course_id"], name: "index_tests_on_course_id", using: :btree

  create_table "user_answers", force: :cascade do |t|
    t.integer  "question_detail_id", limit: 4
    t.integer  "user_id",            limit: 4
    t.text     "user_answer",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",              limit: 255
    t.string   "sex",                    limit: 255
    t.datetime "date_of_birth"
    t.string   "college",                limit: 255
    t.string   "address",                limit: 255
    t.string   "city",                   limit: 255
    t.integer  "pincode",                limit: 4
    t.string   "country",                limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
