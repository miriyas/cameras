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

ActiveRecord::Schema.define(:version => 20130224094133) do

  create_table "cameras", :force => true do |t|
    t.string   "name1"
    t.string   "name2"
    t.string   "company"
    t.string   "class_range"
    t.datetime "release_date"
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
    t.integer  "video_resolution"
    t.integer  "video_fps"
    t.integer  "video_format"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
