# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110303192615) do

  create_table "attendances", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "start_photo_id"
    t.integer  "end_photo_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pauses", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "start_photo_id"
    t.integer  "end_photo_id"
    t.integer  "attendance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size",    :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "image_updated_at"
    t.string   "description"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terminals", :force => true do |t|
    t.string   "mchine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "card"
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "phone"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
