require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

    describe '商品購入機能' do
      before do
        @oeraddress = FactoryBot.build(:item)
      end
  
      context '商品が購入できるとき' do
        it 'クレジットカード情報が入っていれば登録できる' do
          
        end
  
        it 'postal_code, phone ,area_id,municipality, address が入っている '
          expect(@orderaddress).to be_valid
        end
  
        it 'area_idの値が1以外の時' do
          @orderaddress.area_id != '1'
          expect(@orderaddress).to be_valid
        end
  
        it 'delivery_fee_burden_idが1以外の時' do
          @orderaddress.delivery_fee_burden_id != '1'
          expect(@orderaddress).to be_valid
        end
  
        it 'phone の値が11桁以内の時' do
          @orderaddress.phone = '111111111'
          expect(@orderaddress).to be_valid
        end
  
        it 'postal_codeにはハイフンが必要なこと' do
          @orderaddress.postal_code = '123-4577'
          expect(@orderaddress).to be_valid
        end
  
      end

      context '商品が購入できない時' do
        it 'クレジットカードの情報が空の時 ' do
        end


        it 'postal_codeが空の時' do
          @orderaddress.postal_code = ''
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Postal_code can't be blank")
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
          expect( @orderaddress.errors.full_messages).to include("Phone is not a number")
        end

        it 'phoneが12文字以上の時' do
          @orderaddress.phone = 1111111111111111
          @orderaddress.valid?
          expect( @orderaddress.errors.full_messages).to include("Phone is not a number")
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

      end
    end
end
