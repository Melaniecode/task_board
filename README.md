# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# table schema

* users
  create_table "users", force: :cascade do |t|
    t.string "role", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
  end

* tasks
  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.datetime "created_time", null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end

* tags
    create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
  end