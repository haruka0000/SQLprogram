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

ActiveRecord::Schema.define(version: 20150703154835) do

  create_table "evacuations", force: :cascade do |t|
    t.text     "evac"
    t.text     "address"
    t.text     "earthquake"
    t.text     "tsunami"
    t.text     "flood"
    t.text     "surge"
    t.text     "landslide"
    t.text     "fire"
    t.text     "inlandwaters"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
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

  create_table "内水", id: false, force: :cascade do |t|
    t.text "市町村"
    t.text "タイトル"
    t.text "所在地"
    t.text "緯度"
    t.text "経度"
    t.text "写真1"
    t.text "写真2"
    t.text "写真3"
    t.text "写真4"
    t.text "写真5"
    t.text "写真6"
    t.text "写真7"
    t.text "写真8"
    t.text "写真9"
    t.text "写真10"
    t.text "連絡先"
    t.text "分類"
    t.text "災害種別"
    t.text "備考"
  end

  create_table "土砂", id: false, force: :cascade do |t|
    t.text "市町村"
    t.text "タイトル"
    t.text "所在地"
    t.text "緯度"
    t.text "経度"
    t.text "写真1"
    t.text "写真2"
    t.text "写真3"
    t.text "写真4"
    t.text "写真5"
    t.text "写真6"
    t.text "写真7"
    t.text "写真8"
    t.text "写真9"
    t.text "写真10"
    t.text "連絡先"
    t.text "分類"
    t.text "災害種別"
    t.text "備考"
  end

  create_table "地震", id: false, force: :cascade do |t|
    t.text "市町村"
    t.text "タイトル"
    t.text "所在地"
    t.text "緯度"
    t.text "経度"
    t.text "写真1"
    t.text "写真2"
    t.text "写真3"
    t.text "写真4"
    t.text "写真5"
    t.text "写真6"
    t.text "写真7"
    t.text "写真8"
    t.text "写真9"
    t.text "写真10"
    t.text "連絡先"
    t.text "分類"
    t.text "災害種別"
    t.text "備考"
  end

  create_table "津波", id: false, force: :cascade do |t|
    t.text "市町村"
    t.text "タイトル"
    t.text "所在地"
    t.text "緯度"
    t.text "経度"
    t.text "写真1"
    t.text "写真2"
    t.text "写真3"
    t.text "写真4"
    t.text "写真5"
    t.text "写真6"
    t.text "写真7"
    t.text "写真8"
    t.text "写真9"
    t.text "写真10"
    t.text "連絡先"
    t.text "分類"
    t.text "災害種別"
    t.text "備考"
  end

  create_table "洪水", id: false, force: :cascade do |t|
    t.text "市町村"
    t.text "タイトル"
    t.text "所在地"
    t.text "緯度"
    t.text "経度"
    t.text "写真1"
    t.text "写真2"
    t.text "写真3"
    t.text "写真4"
    t.text "写真5"
    t.text "写真6"
    t.text "写真7"
    t.text "写真8"
    t.text "写真9"
    t.text "写真10"
    t.text "連絡先"
    t.text "分類"
    t.text "災害種別"
    t.text "備考"
  end

  create_table "火事", id: false, force: :cascade do |t|
    t.text "市町村"
    t.text "タイトル"
    t.text "所在地"
    t.text "緯度"
    t.text "経度"
    t.text "写真1"
    t.text "写真2"
    t.text "写真3"
    t.text "写真4"
    t.text "写真5"
    t.text "写真6"
    t.text "写真7"
    t.text "写真8"
    t.text "写真9"
    t.text "写真10"
    t.text "連絡先"
    t.text "分類"
    t.text "災害種別"
    t.text "備考"
  end

  create_table "避難所", primary_key: "建物名", force: :cascade do |t|
    t.text "住所"
    t.text "地震"
    t.text "津波"
    t.text "洪水"
    t.text "高潮"
    t.text "土砂"
    t.text "火事"
    t.text "内水"
  end

  add_index "避難所", ["建物名"], name: "sqlite_autoindex_避難所_1", unique: true

  create_table "高潮", id: false, force: :cascade do |t|
    t.text "市町村"
    t.text "タイトル"
    t.text "所在地"
    t.text "緯度"
    t.text "経度"
    t.text "写真1"
    t.text "写真2"
    t.text "写真3"
    t.text "写真4"
    t.text "写真5"
    t.text "写真6"
    t.text "写真7"
    t.text "写真8"
    t.text "写真9"
    t.text "写真10"
    t.text "連絡先"
    t.text "分類"
    t.text "災害種別"
    t.text "備考"
  end

end
