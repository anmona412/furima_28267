class Transaction < ApplicationRecord
  # アソシエーション
  belongs_to :item
  has_one :bought_by
end
