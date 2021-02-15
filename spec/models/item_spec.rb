require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が出品できるとき' do
      it 'product, description, price, imageが入っていれば登録できる' do
        expect(@item).to be_valid
      end

      it 'category_idの値が1以外の時' do
        @item.category_id != '1'
        expect(@item).to be_valid
      end

      it 'state_idの値が1以外の時' do
        @item.state_id != '1'
        expect(@item).to be_valid
      end

      it 'delivery_fee_burden_idが1以外の時' do
        @item.delivery_fee_burden_id != '1'
        expect(@item).to be_valid
      end

      it 'area_id の値が1以外の時' do
        @item.area_id != '1'
        expect(@item).to be_valid
      end

      it 'day_idの値が1以外の時' do
        @item.day_id != '1'
        expect(@item).to be_valid
      end

    end


    context '商品が出品できないとき' do

      it 'productが空の時' do
        @item.product = ''
        @item.valid?
        expect( @item.errors.full_messages).to include("Product can't be blank")
      end

      it 'descriptionが空の時' do
        @item.description = ''
        @item.valid?
        expect( @item.errors.full_messages).to include("Description can't be blank")
      end

      it 'priceが空の時' do
        @item.price = ''
        @item.valid?
        expect( @item.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageが空の時' do
        @item.image = nil
        @item.valid?
        expect( @item.errors.full_messages).to include("Image can't be blank")
      end

      it 'category_idの値が1の時' do
        @item.category_id = 1
        @item.valid?
        expect( @item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'state_idの値が1の時' do
        @item.state_id = 1
        @item.valid?
        expect( @item.errors.full_messages).to include("State must be other than 1")
      end

      it 'delivery_fee_burden_idの値が1の時' do
        @item.delivery_fee_burden_id = 1
        @item.valid?
        expect( @item.errors.full_messages).to include("Delivery fee burden must be other than 1")
      end

      it 'area_id の値が1の時' do
        @item.area_id = 1
        @item.valid?
        expect( @item.errors.full_messages).to include("Area must be other than 1")
      end

      it 'day_idの値が1の時' do
        @item.day_id = 1
        @item.valid?
        expect( @item.errors.full_messages).to include("Day must be other than 1")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '299円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

    end
  end
end
