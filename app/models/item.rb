class Item < ApplicationRecord
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee_burden
  belongs_to :area
  belongs_to :day
  has_one_attached :image


  with_options presence: true do
    with_options format:{ with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
      validates :product
      validates :description
    end
    with_options format:{ with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
      validates :price
    end
    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:9999999 } do
      validates :price
    end
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id 
    validates :state_id
    validates :delivery_fee_burden_id 
    validates :area_id 
    validates :day_id
  end

end
