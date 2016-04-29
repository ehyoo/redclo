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

ActiveRecord::Schema.define(version: 20160429040244) do

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "post_id"
    t.integer  "op_comment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comments", ["op_comment_id"], name: "index_comments_on_op_comment_id"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "cvotes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cvotes", ["comment_id"], name: "index_cvotes_on_comment_id"
  add_index "cvotes", ["user_id"], name: "index_cvotes_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "subderrit_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "posts", ["subderrit_id"], name: "index_posts_on_subderrit_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "pvotes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pvotes", ["post_id"], name: "index_pvotes_on_post_id"
  add_index "pvotes", ["user_id"], name: "index_pvotes_on_user_id"

  create_table "subderrits", force: :cascade do |t|
    t.string   "name"
    t.text     "moderators"
    t.text     "blacklist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_hash"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users_subderrits", force: :cascade do |t|
    t.integer  "subderrit_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "users_subderrits", ["subderrit_id"], name: "index_users_subderrits_on_subderrit_id"
  add_index "users_subderrits", ["user_id"], name: "index_users_subderrits_on_user_id"

end
