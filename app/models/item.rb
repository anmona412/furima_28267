class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
belongs_to :user
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
    validates :user_id, :name, :comment
    validates :price, :numericality => { :greater_than_or_equal_to => 333, :less_than_or_equal_to => 9999999 }
    
    with_options numericality: {other_than: 1 } do
      validates  :category_id, :status_id, :burden_id,:prefecture_id,:send_at_id
    end
  end
end
