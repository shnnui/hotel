class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels, id: :uuid do |t|
      t.uuid :ota_channel_id
      t.string :third_party_hotel_id, limit: 20
      t.uuid :hotel_brand_id
      t.string :name
      t.string :address
      t.datetime :open_at
      t.datetime :close_at
      t.string :phone, limit: 50
      t.string :fax, limit: 50
      t.string :zip_code, limit: 10
      t.boolean :is_economic
      t.boolean :is_apartmen
      t.integer :reocar_city_id
      t.string :city_name, limit: 20
      t.string :city_id, limit: 32
      t.string :business_zone, limit: 50
      t.string :business_zone_id, limit: 32
      t.string :attached_business_zone, limit: 50
      t.string :district, limit: 50
      t.string :district_id, limit: 32
      t.point :baidu_location
      t.point :google_location
      t.integer :star
      t.string :credit_cards
      t.integer :status
      t.integer :review_count
      t.integer :review_good
      t.integer :review_poor
      t.decimal :review_score, precision: 9, scale: 2
      t.text :intro
      t.text :description
      t.string :traffic
      t.boolean :has_coupon
      t.string :themes
      t.integer :room_total
      t.text :facilities
      t.string :stay_leave_info
      t.integer :recommend_level

      t.timestamps
    end
    add_index :hotels, :id, unique: true
    add_index :hotels, :hotel_brand_id
    add_index :hotels, :ota_channel_id
    add_index :hotels, :name
  end
end
