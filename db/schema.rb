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

ActiveRecord::Schema.define(:version => 20121214190550) do

  create_table "albums", :force => true do |t|
    t.integer "cover_photo_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "name_en"
    t.string   "name_hr"
    t.string   "slug"
    t.text     "description_en"
    t.text     "description_hr"
    t.string   "dates_en"
    t.string   "dates_hr"
    t.string   "contact_en"
    t.string   "contact_hr"
    t.string   "price_en"
    t.string   "price_hr"
    t.string   "duration"
    t.integer  "min_people"
    t.integer  "max_people"
    t.integer  "album_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "category"
  end

  create_table "photos", :force => true do |t|
    t.string  "uid"
    t.string  "url"
    t.string  "original_size_url"
    t.string  "title"
    t.string  "stored_on"
    t.integer "album_id"
    t.string  "thumbnail_size_url"
    t.string  "medium_size_url"
  end

  create_table "tweets", :force => true do |t|
    t.string   "tweet_id"
    t.string   "author"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
