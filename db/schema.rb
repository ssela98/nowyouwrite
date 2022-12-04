# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_02_194513) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "root_comment_id"
    t.integer "level", default: 0
    t.integer "story_id", null: false
    t.integer "cached_scoped_like_votes_total", default: 0
    t.integer "cached_scoped_like_votes_score", default: 0
    t.integer "cached_scoped_like_votes_up", default: 0
    t.integer "cached_scoped_like_votes_down", default: 0
    t.integer "cached_weighted_like_score", default: 0
    t.integer "cached_weighted_like_total", default: 0
    t.float "cached_weighted_like_average", default: 0.0
    t.index ["root_comment_id"], name: "index_comments_on_root_comment_id"
    t.index ["story_id"], name: "index_comments_on_story_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "pins", force: :cascade do |t|
    t.integer "story_id", null: false
    t.integer "comment_id", null: false
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_pins_on_comment_id"
    t.index ["story_id", "comment_id"], name: "index_pins_on_story_id_and_comment_id", unique: true
    t.index ["story_id"], name: "index_pins_on_story_id"
  end

  create_table "stories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.boolean "visible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cached_scoped_like_votes_total", default: 0
    t.integer "cached_scoped_like_votes_score", default: 0
    t.integer "cached_scoped_like_votes_up", default: 0
    t.integer "cached_scoped_like_votes_down", default: 0
    t.integer "cached_weighted_like_score", default: 0
    t.integer "cached_weighted_like_total", default: 0
    t.float "cached_weighted_like_average", default: 0.0
    t.index ["user_id"], name: "index_stories_on_user_id"
    t.index ["visible"], name: "index_stories_on_visible"
  end

  create_table "story_tags", force: :cascade do |t|
    t.integer "story_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id", "tag_id"], name: "index_story_tags_on_story_id_and_tag_id", unique: true
    t.index ["story_id"], name: "index_story_tags_on_story_id"
    t.index ["tag_id"], name: "index_story_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", limit: 24, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "comments", column: "root_comment_id"
  add_foreign_key "comments", "stories"
  add_foreign_key "comments", "users"
  add_foreign_key "pins", "comments"
  add_foreign_key "pins", "stories"
  add_foreign_key "story_tags", "stories"
  add_foreign_key "story_tags", "tags"
end
