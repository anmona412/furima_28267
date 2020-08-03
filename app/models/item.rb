class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
belongs_to :users
# has_many               :comments, dependent: :destroy
# has_many               :send_to
# has_one                :bought_by
belongs_to_active_hash :category
belongs_to_active_hash :status
belongs_to_active_hash :burden
belongs_to_active_hash :prefecture
belongs_to_active_hash :send_at
has_one_attached :image

  # バリデーション
  with_options presence: true do
    validates :user_id
    validates :name
    validates :comment
    validates :category_id
    validates :price
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :send_at_id
  end
end
