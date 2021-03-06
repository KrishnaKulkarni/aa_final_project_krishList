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

ActiveRecord::Schema.define(version: 20140506150305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: true do |t|
    t.string   "title",           null: false
    t.string   "address"
    t.string   "region",          null: false
    t.integer  "subcat_id",       null: false
    t.integer  "submitter_id",    null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "responses_count"
  end

  add_index "ads", ["region"], name: "index_ads_on_region", using: :btree
  add_index "ads", ["subcat_id"], name: "index_ads_on_subcat_id", using: :btree
  add_index "ads", ["submitter_id"], name: "index_ads_on_submitter_id", using: :btree
  add_index "ads", ["title"], name: "index_ads_on_title", using: :btree

  create_table "alert_boolean_options", force: true do |t|
    t.integer  "alert_id",                        null: false
    t.integer  "option_class_id",                 null: false
    t.boolean  "value",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alert_boolean_options", ["alert_id"], name: "index_alert_boolean_options_on_alert_id", using: :btree
  add_index "alert_boolean_options", ["option_class_id"], name: "index_alert_boolean_options_on_option_class_id", using: :btree

  create_table "alert_date_options", force: true do |t|
    t.integer  "alert_id",        null: false
    t.integer  "option_class_id", null: false
    t.date     "value",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_lower_bound"
  end

  add_index "alert_date_options", ["alert_id"], name: "index_alert_date_options_on_alert_id", using: :btree
  add_index "alert_date_options", ["option_class_id"], name: "index_alert_date_options_on_option_class_id", using: :btree

  create_table "alert_integer_options", force: true do |t|
    t.integer  "alert_id",        null: false
    t.integer  "option_class_id", null: false
    t.integer  "value",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_lower_bound"
  end

  add_index "alert_integer_options", ["alert_id"], name: "index_alert_integer_options_on_alert_id", using: :btree
  add_index "alert_integer_options", ["option_class_id"], name: "index_alert_integer_options_on_option_class_id", using: :btree

  create_table "alert_string_options", force: true do |t|
    t.integer  "alert_id",        null: false
    t.integer  "option_class_id", null: false
    t.string   "value",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alert_string_options", ["alert_id"], name: "index_alert_string_options_on_alert_id", using: :btree
  add_index "alert_string_options", ["option_class_id"], name: "index_alert_string_options_on_option_class_id", using: :btree

  create_table "alerts", force: true do |t|
    t.integer  "subcat_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alerts", ["subcat_id"], name: "index_alerts_on_subcat_id", using: :btree
  add_index "alerts", ["user_id"], name: "index_alerts_on_user_id", using: :btree

  create_table "boolean_option_values", force: true do |t|
    t.boolean  "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boolean_options", force: true do |t|
    t.integer  "ad_id",           null: false
    t.integer  "option_class_id", null: false
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boolean_options", ["ad_id"], name: "index_boolean_options_on_ad_id", using: :btree
  add_index "boolean_options", ["option_class_id"], name: "index_boolean_options_on_option_class_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["title"], name: "index_categories_on_title", unique: true, using: :btree

  create_table "date_option_values", force: true do |t|
    t.date     "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "date_options", force: true do |t|
    t.integer  "ad_id",           null: false
    t.integer  "option_class_id", null: false
    t.date     "value",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "date_options", ["ad_id"], name: "index_date_options_on_ad_id", using: :btree
  add_index "date_options", ["option_class_id"], name: "index_date_options_on_option_class_id", using: :btree

  create_table "integer_option_values", force: true do |t|
    t.integer  "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "integer_options", force: true do |t|
    t.integer  "ad_id",           null: false
    t.integer  "option_class_id", null: false
    t.integer  "value",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "integer_options", ["ad_id"], name: "index_integer_options_on_ad_id", using: :btree
  add_index "integer_options", ["option_class_id"], name: "index_integer_options_on_option_class_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "notifiable_id",                   null: false
    t.string   "notifiable_type",                 null: false
    t.integer  "event_id",                        null: false
    t.boolean  "is_viewed",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "ad_id"
  end

  add_index "notifications", ["is_viewed"], name: "index_notifications_on_is_viewed", using: :btree
  add_index "notifications", ["notifiable_id"], name: "index_notifications_on_notifiable_id", using: :btree

  create_table "option_classes", force: true do |t|
    t.string   "title",                                 null: false
    t.integer  "option_classable_id",                   null: false
    t.string   "option_classable_type",                 null: false
    t.string   "input_type",                            null: false
    t.string   "value_type",                            null: false
    t.boolean  "is_mandatory",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "option_classes", ["option_classable_id"], name: "index_option_classes_on_option_classable_id", using: :btree
  add_index "option_classes", ["title"], name: "index_option_classes_on_title", using: :btree
  add_index "option_classes", ["value_type"], name: "index_option_classes_on_value_type", using: :btree

  create_table "options", force: true do |t|
    t.integer  "ad_id",             null: false
    t.integer  "option_class_id",   null: false
    t.integer  "option_value_id",   null: false
    t.string   "option_value_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "options", ["ad_id"], name: "index_options_on_ad_id", using: :btree
  add_index "options", ["option_class_id"], name: "index_options_on_option_class_id", using: :btree
  add_index "options", ["option_value_id"], name: "index_options_on_option_value_id", using: :btree

  create_table "pictures", force: true do |t|
    t.integer  "ad_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["ad_id"], name: "index_pictures_on_ad_id", using: :btree

  create_table "responses", force: true do |t|
    t.integer  "ad_id",         null: false
    t.integer  "respondent_id", null: false
    t.string   "title",         null: false
    t.text     "body",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["ad_id"], name: "index_responses_on_ad_id", using: :btree
  add_index "responses", ["respondent_id"], name: "index_responses_on_respondent_id", using: :btree
  add_index "responses", ["title"], name: "index_responses_on_title", using: :btree

  create_table "string_option_values", force: true do |t|
    t.string   "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "string_options", force: true do |t|
    t.integer  "ad_id",           null: false
    t.integer  "option_class_id", null: false
    t.string   "value",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "string_options", ["ad_id"], name: "index_string_options_on_ad_id", using: :btree
  add_index "string_options", ["option_class_id"], name: "index_string_options_on_option_class_id", using: :btree

  create_table "subcats", force: true do |t|
    t.string   "title",                     null: false
    t.integer  "category_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "featured_option_class_id1"
    t.integer  "featured_option_class_id2"
    t.string   "featured_text"
  end

  add_index "subcats", ["category_id"], name: "index_subcats_on_category_id", using: :btree
  add_index "subcats", ["title"], name: "index_subcats_on_title", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                                     null: false
    t.string   "password_digest",                           null: false
    t.string   "session_token",                             null: false
    t.boolean  "is_admin",                  default: false
    t.boolean  "wants_forwarded_responses", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                                  null: false
    t.integer  "notifications_count"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
