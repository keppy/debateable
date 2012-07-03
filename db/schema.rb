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

ActiveRecord::Schema.define(:version => 20120703042125) do

  create_table "debates", :force => true do |t|
    t.string   "title"
    t.integer  "proposition_id"
    t.integer  "opposition_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "proposition_user_id"
    t.integer  "opposition_user_id"
  end

  create_table "oppositions", :force => true do |t|
    t.string   "title"
    t.integer  "debateable_id"
    t.string   "debateable_type"
    t.string   "slide"
    t.string   "footnotes"
    t.string   "response"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.integer  "debate_id"
  end

  create_table "propositions", :force => true do |t|
    t.string   "title"
    t.integer  "debateable_id"
    t.string   "debateable_type"
    t.string   "slide"
    t.string   "footnotes"
    t.string   "response"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.integer  "debate_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
