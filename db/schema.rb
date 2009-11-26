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

ActiveRecord::Schema.define(:version => 20091126122530) do

  create_table "building_occupancies", :force => true do |t|
    t.integer  "building_id"
    t.string   "business_unit"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "state"
    t.string   "suburb"
    t.string   "building_zone",     :default => "CBD"
    t.boolean  "available_for_sip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "floors_count",      :default => 0
  end

  create_table "floors", :force => true do |t|
    t.integer  "building_id"
    t.string   "floor_level"
    t.boolean  "active",              :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "capacity",            :default => 0
    t.integer  "opportunites_count",  :default => 0
    t.integer  "opportunities_count", :default => 0
  end

  add_index "floors", ["building_id"], :name => "index_floors_on_building_id"

  create_table "opportunities", :force => true do |t|
    t.integer  "floor_id"
    t.integer  "num_seats_departing"
    t.integer  "num_seats_arriving"
    t.string   "business_unit"
    t.string   "team"
    t.string   "move_type",           :default => "MOVE"
    t.text     "notes"
    t.string   "status",              :default => "Opportunity"
    t.boolean  "key_move",            :default => false
    t.boolean  "applied",             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "est_date"
    t.integer  "floor_id_arriving"
  end

  add_index "opportunities", ["floor_id"], :name => "index_opportunities_on_floor_id"

  create_table "static_items", :force => true do |t|
    t.string   "list_name"
    t.string   "list_item"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "list_key"
    t.string   "list_img"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.string   "last_login_at"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roles_mask"
  end

end
