FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    family_name_zen         {Gimei.last.kanji}
    given_name_zen          {Gimei.first.kanji}
    family_name_kana        {Gimei.last.katakana}
    given_name_kana         {Gimei.first.katakana}
    birthday                {Faker::Date.between(from: '1930-01-01', to: Date.today)}
  end
end
