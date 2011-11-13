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

ActiveRecord::Schema.define(:version => 20111112202711) do

  create_table "races", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.date     "registration_on"
    t.date     "race_on"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "race_type"
  end

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
    t.string   "type"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
