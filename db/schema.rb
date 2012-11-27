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

ActiveRecord::Schema.define(:version => 20121127203641) do

  create_table "categories", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.text     "address"
    t.text     "company"
    t.integer  "customer_id"
    t.text     "email"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "im"
    t.text     "phone"
    t.text     "referred_by"
    t.text     "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  add_index "contacts", ["user_id"], :name => "index_contacts_on_user_id"

  create_table "estimates", :force => true do |t|
    t.integer  "estimate_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "terms"
    t.string   "notes"
    t.string   "discount"
    t.string   "po_number"
    t.string   "client_id"
    t.date     "date_issued"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "client_id"
    t.date     "date_issued"
    t.float    "discount"
    t.integer  "invoice_number"
    t.text     "po_number"
    t.text     "notes"
    t.text     "terms"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "estimate_id"
    t.text     "description"
    t.text     "name"
    t.float    "price"
    t.integer  "quantity"
    t.decimal  "tax"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "invoice_id"
  end

  add_index "items", ["estimate_id"], :name => "index_items_on_estimate_id"

  create_table "notes", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "notes", ["contact_id"], :name => "index_notes_on_contact_id"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "phones", :force => true do |t|
    t.integer  "contact_id"
    t.text     "number"
    t.text     "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phones", ["contact_id"], :name => "index_phones_on_contact_id"

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.text     "description"
    t.text     "pdf"
    t.text     "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"

  create_table "profiles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "name"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["contact_id"], :name => "index_taggings_on_contact_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
