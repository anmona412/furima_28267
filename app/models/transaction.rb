class Transaction < ApplicationRecord
  # アソシエーション
  belongs_to :item
end
