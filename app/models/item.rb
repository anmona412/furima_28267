class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :send_at
  has_one_attached :image
  has_one :bought_by
  has_one :street, class_name:"Transaction"

  # バリデーション
  with_options presence: true do
    validates :user_id, :name, :comment, :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    with_options numericality: { other_than: 1 } do
      validates  :category_id, :status_id, :burden_id, :prefecture_id, :send_at_id
    end
  end
end
