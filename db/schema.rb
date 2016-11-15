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

ActiveRecord::Schema.define(version: 20161114143109) do

  create_table "favorite_recipes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uri"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "fk_rails_dc8cf51c80", using: :btree
  end

  create_table "ingredients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "unit_of_measure"
    t.string   "picture"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "ingredients_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id",       null: false
    t.integer "ingredient_id", null: false
    t.integer "quantity"
    t.index ["ingredient_id"], name: "fk_rails_d73140a606", using: :btree
    t.index ["user_id"], name: "fk_rails_ac568aa73e", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "confirmed_email",        default: false
    t.string   "confirm_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "profile_name"
    t.string   "profile_last_name"
    t.string   "profile_image"
  end

  add_foreign_key "favorite_recipes", "users"
  add_foreign_key "ingredients_users", "ingredients"
  add_foreign_key "ingredients_users", "users"
end
