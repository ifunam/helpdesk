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

ActiveRecord::Schema.define(:version => 1) do

  create_table "categories", :force => true do |t|
    t.text     "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "ticket_id"
    t.string   "subject",    :null => false
    t.text     "body",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "user_type_id",                        :null => false
    t.string   "name"
    t.string   "controler",    :default => "tickets"
    t.text     "action",                              :null => false
    t.text     "method",       :default => "get"
    t.string   "view"
    t.string   "icon",         :default => ".."
    t.text     "title",                               :null => false
    t.text     "message"
    t.string   "id_tag",       :default => "id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priorities", :force => true do |t|
    t.text     "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "status_id",   :null => false
    t.integer  "category_id", :null => false
    t.integer  "priority_id", :null => false
    t.integer  "user_id",     :null => false
    t.text     "body",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_categories", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "category_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                         :null => false
    t.string   "password"
    t.string   "email"
    t.string   "twitter"
    t.string   "salt"
    t.boolean  "status",     :default => true,  :null => false
    t.boolean  "is_admin",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
