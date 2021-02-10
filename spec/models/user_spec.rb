require 'rails_helper'

  

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    #ユーザー管理機能についてのテストコードを入力する
    it 'nickname, email, password, password_confirmation, first_name, last_name, first_name_ruby, last_name_ruby, birthday が存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'passwordとpassword_confirmationが6文字以上で、英数字をふくめていれば登録できる' do
      @user.password = '11111a'
      @user.password_confirmation = '11111a'
      expect(@user).to be_valid
    end

    it 'first_name, last_name, first_name_ruby, last_name_ruby, が全角なら登録できる' do
      @user.first_name = 'ああああああ'
      @user.last_name = 'ああああああ'
      @user.first_name_ruby = 'あああ'
      @user.last_name_ruby = 'ああああ'
      expect(@user).to be_valid
    end

    

    it 'nicknameが空だと登録できない'do
      @user.nickname = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confimationが空だと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end



    it 'passwordが５文字以下なら登録できない' do
      @user.password = 'aaa'
      @user.password_confirmation = 'aaa'
      @user.valid?
      expect( @user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordは半角英数字でないと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?

    end


    it 'first_nameが空なら登録できない' do
      @user.first_name = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが半角なら登録できない' do
      @user.first_name = 'aaaaaaaa'
      @user.valid?
      expect( @user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it 'last_nameが空なら登録できない' do
      @user.last_name = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが半角なら登録できない' do
      @user.last_name = 'aaaaaaaa'
      @user.valid?
      expect( @user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it 'first_name_rubyが空なら登録できない' do
      @user.first_name_ruby = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("First name ruby can't be blank")
    end

    it 'first_name_rubyが半角なら登録できない ' do
      @user.first_name_ruby = 'aaaaaaaa'
      @user.valid?
      expect( @user.errors.full_messages).to include("First name ruby 全角文字を使用してください")
    end

    it 'last_name_rubyが空なら登録できない' do
      @user.last_name_ruby = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("Last name ruby can't be blank")
    end

    it 'last_name_rubyが半角なら登録できない' do
      @user.last_name_ruby = 'aaaaaaaa'
      @user.valid?
      expect( @user.errors.full_messages).to include("Last name ruby 全角文字を使用してください")
    end

    it 'birthdayが空なら登録できない' do
      @user.birthday = ''
      @user.valid?
      expect( @user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
