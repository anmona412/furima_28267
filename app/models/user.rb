class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# アソシエーション
has_many :items
# has_many :bought_by
# has_many :comments

# バリデーション
  with_options presence: true do
    zen_only = /\A[ぁ-んァ-ン一-龥]/.freeze
    kana_only = /\A[ァ-ヶー－]+\z/.freeze
    num_and_char = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

    validates :nickname, uniqueness: { case_sensitive: true }

    with_options format: { with: zen_only, message: '全角文字で入力してください' } do
      validates :family_name_zen
      validates :given_name_zen
    end

    with_options format: { with: kana_only, message: '全角カタカナで入力してください' } do
      validates :family_name_kana
      validates :given_name_kana
    end

    validates :password, format: { with: num_and_char, message: '英数半角混合で設定してください' }

    validates :birthday
  end
end
