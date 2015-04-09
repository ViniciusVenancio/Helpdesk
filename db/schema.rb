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

ActiveRecord::Schema.define(version: 20150409150812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amendments", force: true do |t|
    t.integer  "contract_id"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "value"
    t.integer  "number"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sent_to_user", default: false
  end

  add_index "comments", ["ticket_id"], name: "index_comments_on_ticket_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contract_types", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "value"
    t.string   "value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", force: true do |t|
    t.integer  "enterprise_id"
    t.date     "start_date"
    t.date     "due_date"
    t.float    "monthly_payment"
    t.integer  "sla"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contract_type_id"
    t.float    "current_value"
  end

  create_table "enterprises", force: true do |t|
    t.string   "name"
    t.string   "corporate_name"
    t.string   "phone"
    t.string   "cnpj"
    t.string   "state_registration"
    t.string   "adress"
    t.integer  "number"
    t.string   "district"
    t.string   "city"
    t.string   "cep"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "category"
    t.integer  "contract_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "user_id"
    t.integer  "agent_id"
    t.string   "priority"
    t.string   "status"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.integer  "enterprise_id"
  end

  add_index "tickets", ["agent_id"], name: "index_tickets_on_agent_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
