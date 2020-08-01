class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname

    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "全角文字で入力してください"} do
      validates :family_name_zen
      validates :given_name_zen
    end
    
    with_options format:{with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください"} do
      validates :family_name_kana 
      validates :given_name_kana
    end
    
    validates :birthday
  end
end
