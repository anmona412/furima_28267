require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context '新規登録がうまく行く時' do
      it '全てのカラムが正しく埋まっている時登録できる' do
        
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかない時' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'アドレスに一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email:@user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'パスワードが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが5文字以下だと登録できない' do
        @user.password = "11qq1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードは英数半角混合でないと登録できない' do
        @user.password = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数半角混合で設定してください")
      end

      it 'パスワード(確認)が空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'パスワードとパスワード(確認)が一致していないと登録できない' do
        @user.password = "11qq11"
        @user.password_confirmation = "111qqq"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'ユーザ本名の名字(全角)が空だと登録できない' do
        @user.family_name_zen = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name zen can't be blank")
      end

      it 'ユーザ本名の名前(全角)が空だと登録できない' do
        @user.given_name_zen = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name zen can't be blank")
      end

      it 'ユーザ本名の名字(全角)が半角文字のみだと登録できない' do
        @user.family_name_zen = Gimei.last.romaji
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name zen 全角文字で入力してください")
      end

      it 'ユーザ本名の名前(全角)が半角文字のみだと登録できない' do
        @user.given_name_zen = Gimei.first.romaji
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name zen 全角文字で入力してください")
      end

      it 'ユーザ本名の名字(全角カナ)が空だと登録できない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'ユーザ本名の名前(全角カナ)が空だと登録できない' do
        @user.given_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana can't be blank")
      end

      it 'ユーザ本名の名字(全角カナ)が全角カナ以外だと登録できない' do
        @user.family_name_kana = "ああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角カタカナで入力してください")
      end

      it 'ユーザ本名の名前(全角カナ)が全角カナ以外だと登録できない' do
        @user.given_name_kana = "ああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana 全角カタカナで入力してください")
      end

      it '誕生日が空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
