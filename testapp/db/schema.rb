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

ActiveRecord::Schema.define(:version => 20101217084343) do

  create_table "inkling_can_can_actions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inkling_logs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.text     "text",       :null => false
    t.integer  "user_id"
  end

  create_table "inkling_paths", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "slug",         :null => false
    t.integer  "content_id"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inkling_permissions", :force => true do |t|
    t.integer  "type_id"
    t.integer  "role_id",           :null => false
    t.integer  "can_can_action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inkling_role_memberships", :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "role_id", :null => false
  end

  create_table "inkling_roles", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inkling_themes", :force => true do |t|
    t.string   "name",                                :null => false
    t.text     "body"
    t.string   "extension",  :default => ".html.erb", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inkling_types", :force => true do |t|
    t.string   "klass_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inkling_users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
