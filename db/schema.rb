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

ActiveRecord::Schema.define(version: 20151209215423) do

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_genres", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "movie_genres", ["genre_id"], name: "index_movie_genres_on_genre_id"
  add_index "movie_genres", ["movie_id"], name: "index_movie_genres_on_movie_id"

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "release_year"
    t.string   "poster"
    t.string   "backdrop"
    t.integer  "api_id"
    t.integer  "vote_count"
    t.decimal  "vote_average"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_movies", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.integer  "pre_watch_rating"
    t.integer  "post_watch_rating"
    t.string   "comment"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "user_movies", ["movie_id"], name: "index_user_movies_on_movie_id"
  add_index "user_movies", ["user_id"], name: "index_user_movies_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.integer  "age"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
