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

ActiveRecord::Schema.define(version: 20140811163304) do

  create_table "chili_pepper_admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chili_pepper_admins", ["email"], name: "index_chili_pepper_admins_on_email", unique: true
  add_index "chili_pepper_admins", ["reset_password_token"], name: "index_chili_pepper_admins_on_reset_password_token", unique: true

  create_table "chili_pepper_annotations", force: true do |t|
    t.integer  "menu_id"
    t.integer  "position"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chili_pepper_dishes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "coeliac"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "vegetarian"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "chili_pepper_items", force: true do |t|
    t.integer  "section_id"
    t.integer  "dish_id"
    t.integer  "position"
    t.decimal  "price",         precision: 5, scale: 2
    t.integer  "column"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "annotation_id"
  end

  create_table "chili_pepper_menus", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "menu_type"
    t.text     "availability",                  limit: 255
    t.decimal  "price",                                     precision: 5, scale: 2
    t.boolean  "published"
    t.string   "downloadable_pdf_file_name"
    t.string   "downloadable_pdf_content_type"
    t.integer  "downloadable_pdf_file_size"
    t.datetime "downloadable_pdf_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "chili_pepper_menus", ["slug"], name: "index_chili_pepper_menus_on_slug", unique: true

  create_table "chili_pepper_sections", force: true do |t|
    t.integer  "menu_id"
    t.text     "description"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "heading"
  end

  add_index "chili_pepper_sections", ["slug"], name: "index_chili_pepper_sections_on_slug", unique: true

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

end
