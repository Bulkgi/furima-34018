require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

    describe '商品購入機能' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        @orderaddress = FactoryBot.build(:order_address, user_id:@user.id, item_id:@item.id)
        sleep 0.1
      end
  
      context '商品が購入できるとき' do
  
        it 'postal_code, phone ,area_id,municipality, address, token が入っている ' do
          expect(@orderaddress).to be_valid
        end
  

        it '建物名が空でも登録できること' do
          @orderaddress.building = ''
          expect(@orderaddress).to be_valid
        end
  
      end

      context '商品が購入できない時' do
        it 'tokenが空の時 ' do
          @orderaddress.token = ''
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Token can't be blank")
        end


        it 'postal_codeが空の時' do
          @orderaddress.postal_code = ''
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeにハイフンがないの時' do
          @orderaddress.postal_code = '1234566'
          @orderaddress.valid?
          
        end

        it 'phoneが空の時' do
          @orderaddress.phone = ''
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Phone can't be blank")
        end

        it 'phoneが全角の時' do
          @orderaddress.phone = 'あああああああ'
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Phone is invalid")
        end

        it 'phoneが12文字以上の時' do
          @orderaddress.phone = '1111111111111111'
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Phone is invalid")
        end

        it 'phoneが数字のみでないと購入できないこと' do
          @orderaddress.phone = '1111111あ'
          @orderaddress.valid? 
          expect( @orderaddress.errors.full_messages).to include("Phone is invalid")
        end


        it 'area_idが1の時' do
          @orderaddress.area_id = 1
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Area must be other than 1")
        end

        it 'municipalityが空の時' do
          @orderaddress.municipality = ''
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Municipality can't be blank")
        end

        it 'addressが空の時' do
          @orderaddress.address = ''
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Address can't be blank")
        end

        it 'user_idがなければ投稿できない' do
          @orderaddress.user_id = nil
          @orderaddress.valid?
          expect(@orderaddress.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idがなければ投稿できない' do
          @orderaddress.item_id = nil
          @orderaddress.valid?
          expect(@orderaddress.errors.full_messages).to include("Item can't be blank")
        end

      end
    end
end
