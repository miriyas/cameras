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

ActiveRecord::Schema.define(:version => 20130309165915) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cameras", :force => true do |t|
    t.string   "name1"
    t.string   "name2"
    t.string   "company"
    t.string   "class_range"
    t.date     "release_date"
    t.string   "sensor_type"
    t.string   "sensor_size"
    t.integer  "sensor_pixel"
    t.string   "image_processor"
    t.string   "mirror_type"
    t.float    "finder_magnify"
    t.integer  "finder_coverage"
    t.string   "metering"
    t.float    "fps"
    t.integer  "shutter_speed"
    t.float    "lcd_size"
    t.integer  "lcd_pixel"
    t.string   "lcd_type"
    t.integer  "af_points_total"
    t.integer  "af_points_cross"
    t.string   "af_sensor"
    t.integer  "iso_high"
    t.integer  "iso_low"
    t.boolean  "liveview"
    t.boolean  "shake_reduction"
    t.integer  "v720fps"
    t.integer  "v1080fps"
    t.string   "video_format"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "image"
    t.string   "name3"
    t.string   "v1080scan"
    t.text     "more_info"
    t.string   "v720scan"
    t.integer  "links_count"
    t.string   "storage"
    t.float    "weight"
    t.float    "d_width"
    t.float    "d_height"
    t.float    "d_depth"
    t.string   "mount"
    t.string   "power"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "content_id"
    t.string   "content_type"
    t.text     "body"
    t.string   "user_ip"
    t.string   "password"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "comments", ["content_type", "content_id"], :name => "index_comments_on_content_type_and_content_id"

  create_table "links", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "content_id"
    t.string   "content_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "links", ["content_type", "content_id"], :name => "index_links_on_content_type_and_content_id"

  create_table "users", :force => true do |t|
    t.string   "name",                            :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "role"
    t.integer  "comments_count"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
