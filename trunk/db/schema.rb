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

ActiveRecord::Schema.define(:version => 20090709055702) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "special"
    t.integer  "price",              :limit => 10, :precision => 10, :scale => 0
    t.integer  "artist_id"
    t.date     "release_date"
    t.text     "description"
    t.integer  "label_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "catalog_number"
    t.string   "to_be_released"
    t.integer  "media"
    t.integer  "viewed"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "news"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "realname"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "concert_info"
    t.date     "since"
    t.date     "till"
    t.integer  "special"
    t.string   "trivia"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "viewed"
    t.integer  "status"
    t.integer  "old_id"
    t.string   "image_source"
    t.string   "image_source_url"
  end

  create_table "band_memberships", :force => true do |t|
    t.integer  "member_id"
    t.integer  "band_id"
    t.date     "joined"
    t.date     "left"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "email"
    t.string   "addres"
    t.integer  "viewed"
    t.text     "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "nicknames", :force => true do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.string   "name"
    t.integer  "length"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.text     "description"
    t.integer  "viewed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "acapella"
    t.boolean  "radio_edit"
    t.boolean  "instrumental"
    t.integer  "status"
  end

  create_table "track_appearances", :force => true do |t|
    t.integer  "album_id"
    t.integer  "song_id"
    t.string   "as_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "is_admin",                                :default => false
  end

end
