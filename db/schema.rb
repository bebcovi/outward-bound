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

ActiveRecord::Schema.define(version: 20130702001036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.integer "cover_photo_id"
    t.string  "name_en"
    t.string  "name_hr"
  end

  create_table "announcements", force: true do |t|
    t.string   "content_en"
    t.string   "content_hr"
    t.integer  "post_id"
    t.date     "expires_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "hr"
    t.boolean  "en"
  end

  create_table "attachments", force: true do |t|
    t.string   "name_hr"
    t.string   "name_en"
    t.integer  "post_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "document_id"
  end

  create_table "carousel_photos", force: true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "crop_x"
    t.float    "crop_y"
    t.float    "crop_w"
    t.float    "crop_h"
  end

  create_table "categories", force: true do |t|
    t.string  "name_en"
    t.string  "name_hr"
    t.integer "position"
    t.boolean "hr"
    t.boolean "en"
  end

  create_table "courses", force: true do |t|
    t.string  "name_en"
    t.string  "name_hr"
    t.text    "description_en"
    t.text    "description_hr"
    t.string  "dates_en"
    t.string  "dates_hr"
    t.string  "contact_en"
    t.string  "contact_hr"
    t.string  "price_en"
    t.string  "price_hr"
    t.string  "capacity_en"
    t.string  "capacity_hr"
    t.integer "category_id"
    t.string  "duration_hr"
    t.string  "duration_en"
    t.integer "application_form_id"
    t.integer "album_id"
    t.boolean "hr"
    t.boolean "en"
  end

  create_table "documents", force: true do |t|
    t.string   "file_en"
    t.string   "file_hr"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true, using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "photos", force: true do |t|
    t.string   "file"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title_en"
    t.string   "title_hr"
    t.text     "body_en"
    t.text     "body_hr"
    t.integer  "album_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "hr"
    t.boolean  "en"
    t.integer  "cover_photo_id"
  end

  create_table "tweets", force: true do |t|
    t.string   "author"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "locale"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "encrypted_password"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
