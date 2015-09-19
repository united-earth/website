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

ActiveRecord::Schema.define(version: 20150919171558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "country"
    t.string   "website"
    t.string   "logo"
    t.boolean  "cat_ecological"
    t.boolean  "cat_environment"
    t.boolean  "cat_indi"
    t.boolean  "cat_social"
    t.boolean  "cat_economics"
    t.boolean  "cat_political"
    t.boolean  "cat_animal"
    t.boolean  "cat_activism"
    t.boolean  "cat_tech"
    t.boolean  "cat_holistic"
    t.boolean  "cat_conscious"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "deleted",         default: false
  end

  create_table "personal_infos", force: :cascade do |t|
    t.boolean  "add_voice",             default: true
    t.boolean  "newsletter",            default: true
    t.text     "public_feedback"
    t.boolean  "contrib_admin"
    t.boolean  "contrib_coord"
    t.boolean  "contrib_writing"
    t.boolean  "contrib_translations"
    t.boolean  "contrib_webdev"
    t.boolean  "contrib_design"
    t.boolean  "contrib_dev"
    t.boolean  "contrib_avprod"
    t.boolean  "contrib_communication"
    t.boolean  "contrib_networking"
    t.boolean  "contrib_education"
    t.boolean  "contrib_art"
    t.boolean  "contrib_management"
    t.boolean  "contrib_fundraising"
    t.boolean  "contrib_funding"
    t.string   "contrib_other"
    t.string   "expertise"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
