require 'rails_helper'

RSpec.describe ItemBought, type: :model do
  describe '購入情報の保存' do
    before do
      @item_bought = FactoryBot.build(:item_bought)
    end

    context '商品購入ができる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@item_bought).to be_valid
      end
      it '建物は空でも購入できる' do
        @item_bought.building = nil
        expect(@item_bought).to be_valid
      end
    end

    context '商品が購入できない時' do
      it '郵便番号がない時' do
        @item_bought.postal_code = nil
        @item_bought.valid?
        expect(@item_bought.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがない時' do
        @item_bought.postal_code = 1_112_222
        @item_bought.valid?
        expect(@item_bought.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県がない時' do
        @item_bought.prefecture_id = nil
        @item_bought.valid?
        expect(@item_bought.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が"---である時' do
        @item_bought.prefecture_id = 1
        @item_bought.valid?
        expect(@item_bought.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村がない時' do
        @item_bought.city = nil
        @item_bought.valid?
        expect(@item_bought.errors.full_messages).to include("City can't be blank")
      end
      it '番地がない時' do
        @item_bought.address = nil
        @item_bought.valid?
        expect(@item_bought.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がない時' do
        @item_bought.phone_number = nil
        @item_bought.valid?
        expect(@item_bought.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁以上の時' do
        @item_bought.phone_number = 111_222_233_334
        @item_bought.valid?
        expect(@item_bought.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
