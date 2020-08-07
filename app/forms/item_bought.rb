# class ItemBought

#   include ActiveModel::Model
#   attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number
#     # バリデーション
#   with_options presence: true do
#     validtaes :item, :prefecture_id, :city, :address
#     validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
#     validates :phone_number, format: {with: /\A[0-9]{,11}\z/}
#   end

#   def save
#     Transaction.create(
#       item_id: item_id,
#       postal_code: postal_code,
#       prefecture_id: prefecture_id,
#       city: city,
#       address: address,
#       building: building,
#       phone_number: phone_number
#     )

#     Bought_by.create(user_id: current_user.id, item_id: item.id)
#   end
# end