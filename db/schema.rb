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

ActiveRecord::Schema.define(version: 20170327153305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
    t.index ["work_id"], name: "index_articles_on_work_id", using: :btree
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "bust_file_name"
    t.string   "bust_content_type"
    t.integer  "bust_file_size"
    t.datetime "bust_updated_at"
    t.string   "slug"
    t.index ["slug"], name: "index_authors_on_slug", unique: true, using: :btree
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "name"
    t.integer  "start_line"
    t.integer  "end_line"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_chapters_on_slug", unique: true, using: :btree
    t.index ["work_id"], name: "index_chapters_on_work_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.integer  "start_line"
    t.integer  "end_line"
    t.text     "original"
    t.text     "translation"
    t.integer  "chapter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["chapter_id"], name: "index_sections_on_chapter_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "bust_file_name"
    t.string   "bust_content_type"
    t.integer  "bust_file_size"
    t.datetime "bust_updated_at"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  create_table "works", force: :cascade do |t|
    t.string   "name"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["author_id"], name: "index_works_on_author_id", using: :btree
    t.index ["slug"], name: "index_works_on_slug", unique: true, using: :btree
  end

  add_foreign_key "articles", "works"
  add_foreign_key "chapters", "works"
  add_foreign_key "sections", "chapters"
  add_foreign_key "works", "authors"
end
