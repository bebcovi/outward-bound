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

ActiveRecord::Schema.define(:version => 20120722192412) do

  create_table "applications", :force => true do |t|
    t.integer  "course_id"
    t.date     "starts_at"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "weight"
    t.integer  "height"
    t.string   "gender"
    t.string   "passport_number"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "email"
    t.string   "occupation"
    t.text     "past_experience"
    t.float    "boot_size"
    t.string   "shirt_size"
    t.text     "sports"
    t.text     "contact"
    t.string   "tobacco"
    t.string   "alcohol"
    t.text     "health"
    t.boolean  "insurance"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "categories", :force => true do |t|
    t.string  "name_hr"
    t.string  "name_en"
    t.string  "uid"
    t.string  "object"
    t.integer "ordinal"
  end

  create_table "contents", :force => true do |t|
    t.text     "body_hr"
    t.text     "body_en"
    t.string   "uid"
    t.integer  "ordinal"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string  "name_hr"
    t.string  "name_en"
    t.string  "slug"
    t.text    "description_hr"
    t.text    "description_en"
    t.integer "ordinal"
    t.integer "category_id"
  end

  create_table "events", :force => true do |t|
    t.string   "name_hr"
    t.string   "name_en"
    t.date     "start_at"
    t.date     "end_at"
    t.string   "color"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title_hr"
    t.string   "title_en"
    t.text     "body_hr"
    t.text     "body_en"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tweets", :force => true do |t|
    t.string   "tweet_id"
    t.string   "author"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
