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

ActiveRecord::Schema.define(version: 20161103121513) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "category"
    t.string   "cold_email_sent"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.boolean  "email_confirmed",                                  default: false
    t.string   "confirm_token"
    t.string   "category"
    t.boolean  "checkbox_ticked"
    t.string   "company_name"
    t.string   "name"
    t.integer  "facebook_followers"
    t.integer  "youtube_followers"
    t.integer  "pinterest_followers"
    t.integer  "instagram_followers"
    t.integer  "other_media_followers"
    t.string   "country"
    t.string   "style"
    t.string   "gender_focus"
    t.integer  "design_experience"
    t.string   "total_offline_and_online_audience_marketing_cost"
    t.string   "viewer_base_description"
    t.string   "channel_adress"
    t.string   "company_url"
    t.string   "product_or_service_industry"
    t.text     "customer_description"
  end

end
