FactoryBot.define do
  factory :item_bought do
    postal_code     { '111-2222' }
    prefecture_id   { 2 }
    city            { Faker::Address.city }
    address         { Faker::Address.street_address }
    building        { Faker::Address.secondary_address }
    phone_number    { Faker::Number.number(digits: 11) }
    user_id         { 1 }
    item_id         { 2 }
  end
end
