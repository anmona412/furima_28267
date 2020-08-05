FactoryBot.define do
  factory :item do
    name          {Faker::Games::Pokemon.name}
    comment       {Faker::Lorem.sentence}
    category_id   {2}
    price         {Faker::Number.between(from: 333, to: 9999999)}
    status_id     {2}
    burden_id     {2}
    prefecture_id {2}
    send_at_id    {2}
    # association   :user

    after(:build) do |item|
      item.user_id = create(:user).id
    end
  end
end
