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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111217175530) do

  create_table "answers", :force => true do |t|
    t.integer  "event_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["event_id", "question_id"], :name => "index_answers_on_event_id_and_question_id", :unique => true

  create_table "event_dates", :force => true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_dates", ["event_id"], :name => "index_event_dates_on_event_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_users_table", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.boolean  "registered",      :default => true
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_questions", :force => true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_questions", ["question_id", "user_id"], :name => "index_user_questions_on_question_id_and_user_id", :unique => true

  create_table "user_races", :force => true do |t|
    t.integer  "race_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_searches", :force => true do |t|
    t.date     "start_on"
    t.date     "end_on"
    t.integer  "user_id"
    t.string   "city"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",   :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "registered",                            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
