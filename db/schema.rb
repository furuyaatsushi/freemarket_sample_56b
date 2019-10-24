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

ActiveRecord::Schema.define(version: 20191024154613) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "number",        null: false
    t.string   "month",         null: false
    t.string   "year",          null: false
    t.string   "security_code", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_credits_on_user_id", using: :btree
  end

  create_table "evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "evaluation", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_evaluations_on_user_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                               null: false
    t.text     "description",          limit: 65535, null: false
    t.string   "status",                             null: false
    t.string   "size"
    t.string   "shipping_charge",                    null: false
    t.string   "days_before_shipment",               null: false
    t.integer  "price",                              null: false
    t.integer  "saler_id",                           null: false
    t.integer  "buyer_id",                           null: false
    t.integer  "prefecture_id",                      null: false
    t.integer  "category_id",                        null: false
    t.integer  "brand_id",                           null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["buyer_id"], name: "fk_rails_bac2cf3aef", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["prefecture_id"], name: "index_items_on_prefecture_id", using: :btree
    t.index ["saler_id"], name: "fk_rails_08d97cf4c9", using: :btree
  end

  create_table "prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                          null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "last_name",                                         null: false
    t.string   "first_name",                                        null: false
    t.string   "last_name_kana",                                    null: false
    t.string   "first_name_kana",                                   null: false
    t.date     "birthday",                                          null: false
    t.string   "phone_number",                                      null: false
    t.string   "postcode",                                          null: false
    t.integer  "prefecture_id",                                     null: false
    t.string   "city",                                              null: false
    t.string   "address",                                           null: false
    t.string   "building"
    t.string   "phone_number_sub"
    t.text     "profile",                limit: 65535
    t.integer  "point",                                             null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["prefecture_id"], name: "index_users_on_prefecture_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "credits", "users"
  add_foreign_key "evaluations", "users"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "prefectures"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "saler_id"
  add_foreign_key "users", "prefectures"
end
