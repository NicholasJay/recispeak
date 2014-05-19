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

ActiveRecord::Schema.define(version: 20140519172011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: true do |t|
    t.text    "entry"
    t.integer "recipe_id"
  end

  create_table "recipe_book_entries", force: true do |t|
    t.integer "recipe_id"
    t.integer "recipe_book_id"
  end

  create_table "recipe_books", force: true do |t|
    t.string   "title"
    t.string   "cover_photo"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comments"
    t.string   "photo"
    t.integer  "user_id"
    t.integer  "recipe_id"
  end

  create_table "recipes", force: true do |t|
    t.string   "category"
    t.string   "title"
    t.text     "notes"
    t.string   "recipe_photo"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.string  "step_number"
    t.text    "instructions"
    t.integer "recipe_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.date     "birthday"
    t.string   "facebook_url"
    t.string   "twitter_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "password_digest"
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

end
