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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161031015031) do
=======
ActiveRecord::Schema.define(version: 20161030202718) do

  create_table "ingredientes_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id",        null: false
    t.integer "ingrediente_id", null: false
    t.integer "quantidade"
  end

  create_table "ingredients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome"
    t.string   "unidade_medida"
    t.string   "foto"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end
>>>>>>> 072fbabb21eb1f9925032e6f68546613b81bf626

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
  end

end
