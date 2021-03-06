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

ActiveRecord::Schema.define(version: 20171114223206) do

  create_table "repplies", force: :cascade do |t|
    t.text "text"
    t.integer "tweet_id"
    t.integer "author_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id_id"], name: "index_repplies_on_author_id_id"
    t.index ["tweet_id"], name: "index_repplies_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "author_id_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id_id"], name: "index_tweets_on_author_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
