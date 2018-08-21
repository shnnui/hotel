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

ActiveRecord::Schema.define(version: 2018_06_14_092236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "hotels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "ota_channel_id"
    t.string "third_party_hotel_id", limit: 20
    t.uuid "hotel_brand_id"
    t.string "name"
    t.string "address"
    t.datetime "open_at"
    t.datetime "close_at"
    t.string "phone", limit: 50
    t.string "fax", limit: 50
    t.string "zip_code", limit: 10
    t.boolean "is_economic"
    t.boolean "is_apartmen"
    t.integer "reocar_city_id"
    t.string "city_name", limit: 20
    t.string "city_id", limit: 32
    t.string "business_zone", limit: 50
    t.string "business_zone_id", limit: 32
    t.string "attached_business_zone", limit: 50
    t.string "district", limit: 50
    t.string "district_id", limit: 32
    t.point "baidu_location"
    t.point "google_location"
    t.integer "star"
    t.string "credit_cards"
    t.integer "status"
    t.integer "review_count"
    t.integer "review_good"
    t.integer "review_poor"
    t.decimal "review_score", precision: 9, scale: 2
    t.text "intro"
    t.text "description"
    t.string "traffic"
    t.boolean "has_coupon"
    t.string "themes"
    t.integer "room_total"
    t.text "facilities"
    t.string "stay_leave_info"
    t.integer "recommend_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_brand_id"], name: "index_hotels_on_hotel_brand_id"
    t.index ["id"], name: "index_hotels_on_id", unique: true
    t.index ["name"], name: "index_hotels_on_name"
    t.index ["ota_channel_id"], name: "index_hotels_on_ota_channel_id"
  end

end
