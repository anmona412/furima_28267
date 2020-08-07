class Transaction < ApplicationRecord
  # アソシエーション
  belongs_to :item
  belongs_to_active_hash :prefecture


end
