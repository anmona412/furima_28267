class ItemBought
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token
  # バリデーション
  with_options presence: true do
    validates :item_id, :user_id, :city, :address
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A[0-9]{,11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    Transaction.create(
      item_id: item_id,
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number
    )
    BoughtBy.create(user_id: user_id, item_id: item_id)
  end
end
