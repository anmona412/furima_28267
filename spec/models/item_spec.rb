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
  end
end
