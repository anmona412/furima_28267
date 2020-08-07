class Transaction < ApplicationRecord
  # アソシエーション
  belongs_to :item
  belongs_to_active_hash :prefecture

  # バリデーション
  with_options presence: true do
    validtaes :item, :prefecture_id, :city, :address, :building 
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/}
  end
end
