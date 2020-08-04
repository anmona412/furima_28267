require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/public/images/test_image.png')
    end
    
    context '商品出品がうまく行く時' do
      it '全てのカラムが正しく埋まっている時登録できる' do
        # binding.pry
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it '画像が一枚必須である' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須である' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が必須である' do
        @item.comment = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end

      it 'カテゴリの情報が必須' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリの情報が"---"ではない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態の情報が必須' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '商品の状態の情報が"---"ではない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it '配送料の負担の情報が必須' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end

      it '配送料の負担の情報が"---"ではない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end

      it '発送元の地域についての情報が必須' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送元の地域についての情報が"---"ではない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数についての情報が必須' do
        @item.send_at_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send at can't be blank")
      end

      it '発送までの日数についての情報が"---"ではない' do
        @item.send_at_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send at must be other than 1")
      end

      it '価格についての情報が必須' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
